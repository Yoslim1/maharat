#!/usr/bin/env bash
# Read-only doctor for the Maharat Android testing stack.
# It does not install packages, change device state, or upload data.
set -u

APPIUM_URL="${APPIUM_URL:-http://127.0.0.1:4723/status}"
ADB_SERIAL="${ADB_SERIAL:-}"
REQUIRE_DEVICE="${REQUIRE_DEVICE:-0}"
JSON_MODE=0
if [[ "${1:-}" == "--json" ]]; then JSON_MODE=1; fi

required_missing=()
optional_missing=()
warnings=()
checks=()

add_check() {
  local name="$1" status="$2" detail="$3"
  checks+=("$name|$status|$detail")
}

command_version() {
  local cmd="$1"
  case "$cmd" in
    adb) adb version 2>/dev/null | head -n 1 ;;
    appium) appium --version 2>/dev/null | head -n 1 ;;
    node) node --version 2>/dev/null | head -n 1 ;;
    npm) npm --version 2>/dev/null | head -n 1 ;;
    python3) python3 --version 2>/dev/null | head -n 1 ;;
    pytest) pytest --version 2>/dev/null | head -n 1 ;;
    *) "$cmd" --version 2>/dev/null | head -n 1 ;;
  esac
}

require_command() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    add_check "$cmd" "ok" "$(command_version "$cmd")"
  else
    required_missing+=("$cmd")
    add_check "$cmd" "missing" "required command not found"
  fi
}

optional_command() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    add_check "$cmd" "ok" "$(command_version "$cmd")"
  else
    optional_missing+=("$cmd")
    add_check "$cmd" "optional-missing" "install only if this capability is selected"
  fi
}

require_command bash
require_command adb
require_command node
require_command npm
require_command python3
require_command pytest
optional_command appium
optional_command agent-device
optional_command nat
optional_command scrcpy
optional_command tesseract
optional_command opencv_version
optional_command mobsfscan
optional_command perfetto
optional_command curl

sdk_root="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-}}"
if [[ -n "$sdk_root" && -d "$sdk_root" ]]; then
  add_check "android-sdk" "ok" "$sdk_root"
else
  warnings+=("ANDROID_SDK_ROOT/ANDROID_HOME is not set to an existing directory")
  add_check "android-sdk" "warning" "set ANDROID_SDK_ROOT or ANDROID_HOME when SDK tools are needed"
fi

adb_state="not-checked"
if command -v adb >/dev/null 2>&1; then
  mapfile -t devices < <(adb devices 2>/dev/null | awk 'NR > 1 && $2 != "" {print $1" "$2}')
  if ((${#devices[@]} == 0)); then
    adb_state="no-device"
    warnings+=("no authorized Android device or emulator is visible to adb")
    add_check "adb-device" "warning" "no device; use an emulator or authorized test phone"
  else
    adb_state="${devices[*]}"
    add_check "adb-device" "ok" "$adb_state"
    if [[ -n "$ADB_SERIAL" ]] && ! printf '%s\n' "${devices[@]}" | awk -v s="$ADB_SERIAL" '$1 == s {found=1} END {exit !found}'; then
      warnings+=("ADB_SERIAL=$ADB_SERIAL was not found in adb devices")
      add_check "adb-serial" "warning" "requested serial is not visible"
    fi
  fi
fi

if [[ "$REQUIRE_DEVICE" == "1" && "$adb_state" == "no-device" ]]; then
  required_missing+=("authorized Android device/emulator")
fi

if command -v curl >/dev/null 2>&1; then
  if curl --silent --show-error --max-time 2 "$APPIUM_URL" >/tmp/maharat-appium-doctor.$$ 2>/dev/null; then
    if grep -q 'ready' /tmp/maharat-appium-doctor.$$; then
      add_check "appium-status" "ok" "$APPIUM_URL reports ready"
    else
      warnings+=("Appium responded, but its status did not contain ready")
      add_check "appium-status" "warning" "response received without ready marker"
    fi
  else
    add_check "appium-status" "not-running" "no local response at $APPIUM_URL"
  fi
  rm -f /tmp/maharat-appium-doctor.$$
fi

if [[ "$JSON_MODE" == "1" ]]; then
  unit_separator=$'\x1f'
  required_arg=$(IFS="$unit_separator"; printf '%s' "${required_missing[*]:-}")
  optional_arg=$(IFS="$unit_separator"; printf '%s' "${optional_missing[*]:-}")
  warnings_arg=$(IFS="$unit_separator"; printf '%s' "${warnings[*]:-}")
  python3 - "$REQUIRE_DEVICE" "$required_arg" "$optional_arg" "$warnings_arg" "$unit_separator" <<'PY'
import json, sys
req, required, optional, warnings, separator = sys.argv[1:]
print(json.dumps({
    "read_only": True,
    "require_device": req == "1",
    "required_missing": required.split(separator) if required else [],
    "optional_missing": optional.split(separator) if optional else [],
    "warnings": warnings.split(separator) if warnings else [],
}, ensure_ascii=False, indent=2))
PY
  exit $(( ${#required_missing[@]} > 0 ? 1 : 0 ))
fi

printf '%s\n' 'Maharat Android Tool Doctor (read-only)'
printf '%s\n' '========================================'
for item in "${checks[@]}"; do
  IFS='|' read -r name status detail <<< "$item"
  printf '[%-16s] %-16s %s\n' "$status" "$name" "$detail"
done
printf '\nRequired missing: %s\n' "${required_missing[*]:-none}"
printf 'Optional missing: %s\n' "${optional_missing[*]:-none}"
printf 'Warnings: %s\n' "${#warnings[@]}"
for warning in "${warnings[@]}"; do printf '  - %s\n' "$warning"; done

if ((${#required_missing[@]} > 0)); then
  printf '\nRESULT: NOT READY (required prerequisites are missing)\n'
  exit 1
fi
printf '\nRESULT: BASE TOOLCHAIN READY; review warnings before running a device test\n'
exit 0

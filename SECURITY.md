# Security Notes

Agent Skills are instruction packages. Treat every upstream `SKILL.md`, script, reference, and template as untrusted content until reviewed.

Before enabling a skill for an agent, inspect its `SKILL.md`, check external commands, review network access, and confirm that it does not request secrets or destructive actions unrelated to the task. Do not run upstream scripts automatically. Use a sandbox or a least-privilege project directory for validation.

This collection intentionally separates reference-only repositories from vendored skills when a clear redistributable license was not available in the checked snapshot. Re-check the upstream repository, its current commit, and its license before updating or shipping a skill.

Report security concerns through the GitHub issue tracker for this repository and include the local path, upstream URL, commit, and a minimal reproduction that does not expose secrets.

---
name: bounded-self-improvement
description: Bounded self-improvement for coding agents. Use after a task, failure, review, or repeated user correction to record a reusable lesson, detect regressions, and propose a small improvement without modifying agent configuration or merging changes automatically.
---

# Bounded Self-Improvement

Improve the workflow through evidence, not unrestricted self-modification. This skill records what happened, identifies the smallest reusable lesson, and proposes a controlled change for human review.

## Capture

After a meaningful task, record only the minimum useful facts: the goal, the observed failure or successful pattern, the evidence that supports it, the project scope, and whether the lesson is local or reusable. Never store secrets, access tokens, private user data, or complete source files in a learning note.

## Classify

Classify the lesson as one of: project convention, recurring implementation pattern, verification gap, documentation gap, or candidate skill improvement. Do not turn a one-off preference into a global rule. Do not promote a lesson when the evidence is only an assumption or an unverified model response.

## Propose

Write a small proposal containing the exact file or skill that would change, the expected benefit, the possible regression, and the verification command. Prefer a documentation or test improvement before changing an always-on instruction. Prefer a local project rule before a global agent rule.

## Verify

Before promotion, reproduce the original failure when practical, run the relevant tests, and compare the result with the previous behavior. A lesson is not considered learned until the evidence is recorded. If verification is unavailable, mark the proposal as unverified and do not promote it.

## Approval boundary

Never edit agent configuration, system prompts, installed skills, permissions, hooks, credentials, or repository protection rules automatically. Never merge or publish a self-generated change without explicit human approval. Open a reviewable patch or Pull Request instead.

## Retirement

Retire lessons that are contradicted by current project conventions, duplicate a stronger rule, or have not been useful after repeated review. Keep the learning log short and link each promoted rule to its evidence.

## Output

Return a concise record with: lesson, evidence, scope, proposed change, regression risk, verification, and approval status.

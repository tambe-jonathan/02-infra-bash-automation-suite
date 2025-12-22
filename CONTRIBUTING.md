# INTERNAL ENGINEERING CONTRIBUTION POLICY
## Bash Automation Toolkit for DevOps Engineers

> **Document Classification:** Internal  
> **Owning Team:** Platform Automation / SRE  
> **Scope:** Production Infrastructure Automation  
>
> This document defines the mandatory standards, workflows, and enforcement rules for contributing to the Bash Automation Toolkit.  
> All changes are treated as **production infrastructure changes** and are subject to enterprise governance.

---

## 1. Purpose & Intent
The Bash Automation Toolkit is an internal automation platform used to standardize, validate, and operate Linux infrastructure across environments.

The primary goals of this policy are to:
- Reduce operational risk
- Enforce consistent automation standards
- Ensure auditability and reliability
- Prevent unsafe or ad-hoc scripting practices

---

## 2. Eligible Contributors
Authorized contributors include:
- Platform / DevOps Engineers
- Site Reliability Engineers (SRE)
- Infrastructure Engineers

---

## 3. Contribution Lifecycle
All changes follow a controlled, review-driven lifecycle.

### 3.1 Branching Strategy
All work must be performed on feature branches created from `main`.

```bash
git checkout -b feature/<short-description>
```

**Examples:**
- `feature/add-disk-check`
- `feature/improve-log-cleanup`

**Direct commits to `main` are prohibited.**

---

## 4. Development Standards
All scripts must adhere to the following rules:
- **Single responsibility** per script
- **Idempotent behavior** where applicable
- **No hard-coded** environment-specific values
- **Fail-fast behavior** on errors
- **Clear, structured, and actionable** output

Where applicable, scripts should include:
```bash
#!/bin/bash
set -euo pipefail
```
Unsafe patterns, silent failures, or ambiguous output are not permitted.

---

## 5. Mandatory Local Validation
Before opening a pull request, contributors must validate changes locally.

```bash
# Bash syntax validation
bash -n scripts/**/*.sh

# Static analysis
shellcheck scripts/**/*.sh

# Functional testing
tests/test_system_health.sh
```
If any validation step fails, the change is not eligible for review.

---

## 6. Pull Request Requirements
Every pull request must include:
- A clear description of what changed and why
- Evidence that local validation was performed
- Tests added or updated when behavior changes

**Pull requests will be rejected if:**
- CI pipeline fails
- ShellCheck violations exist
- Unsafe or destructive behavior is introduced
- Changes are undocumented
- Scope or intent is unclear

---

## 7. CI/CD Enforcement Policy
The CI pipeline is the authoritative quality gate. CI enforces:
- Bash syntax validation
- ShellCheck static analysis
- Executable permission checks
- Automated functional testing

No script is approved for execution unless all CI stages pass. CI output is considered the single source of truth.

---

## 8. Security & Safety Requirements
- Least-privilege execution at all times
- Explicit and justified use of sudo
- No credentials, secrets, or tokens in scripts
- No destructive operations without safeguards
- No modification of critical system paths without approval

---

## 9. Testing Standards
- Critical scripts require automated tests
- Tests must be deterministic and repeatable
- Tests must not rely on external services
- Tests must be safe to run in CI and containerized environments

---

## 10. Documentation Obligations
Any change that alters behavior must include:
- README updates (if user-facing)
- Inline comments for non-obvious logic
- Changelog entry for significant changes

---

## 11. Code Review Policy
- Minimum of one qualified reviewer is required
- Reviewers must understand infrastructure operations
- Reviewers are responsible for assessing operational and security risk

---

## 12. Ownership & Accountability
Once merged:
- The Platform Automation Team assumes operational ownership
- Contributors may be consulted during incidents related to their changes
- All contributors are expected to participate in continuous improvement.

---

## 13. Final Enforcement Statement
This repository intentionally mirrors enterprise-grade internal tooling. If a change would not be acceptable in a real production environment, it does not belong in this repository.

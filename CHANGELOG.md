# CHANGELOG – Bash Automation Toolkit for DevOps Engineers

This file is a **versioned changelog template** designed for professional enterprise use.  
It ensures every change, addition, or fix is clearly documented, making the repository audit-ready and portfolio-friendly.

---

## [Unreleased]
### Added
- Describe new features, scripts, or modules added.
- Include new tests, CI/CD pipeline steps, or Docker enhancements.
- Example: `scripts/new_script.sh` added to perform X task.

### Changed
- Describe modifications to existing scripts, pipeline, or configuration.
- Example: `system_health.sh` updated to include memory swap usage.

### Fixed
- Describe bug fixes or corrections to scripts or CI/CD steps.
- Example: Corrected permission check in `cleanup_logs.sh`.

### Deprecated
- Describe any features, scripts, or commands that are no longer recommended.
- Example: Old logging mechanism removed.

### Removed
- Describe scripts or modules removed from the repository.
- Example: `scripts/old_script.sh` deleted.

### Security
- Describe any security patches, sensitive information fixes, or permission hardening.
- Example: `user_management.sh` improved to validate username input.

---

## [1.0.0] – 2025-12-22
### Added
- Initial release with all production-ready scripts:
  - `system_health.sh`, `system_health_metrics.sh`, `cleanup_logs.sh`, `backup_directory.sh`, `user_management.sh`, `install_packages.sh`, `service_status.sh`.
- CI/CD Pipeline: Jenkinsfile with syntax checks, ShellCheck, permission validation, and automated tests.
- Dockerized execution: `Dockerfile` and `docker-compose.yml`.
- Cloud-init bootstrap: `examples/cloud-init.yaml`.
- Cron job examples: `examples/crontab_example.txt`.
- Professional README.md with design principles, usage, and onboarding guide.
- Test script: `tests/test_system_health.sh`.

---

## Guidelines for Future Updates

1. Increment **version numbers** following **semantic versioning**:
   - Major: breaking changes, removed scripts, or fundamental redesign.
   - Minor: new features, scripts, or non-breaking enhancements.
   - Patch: bug fixes, test improvements, or CI/CD fixes.

2. Always document under the `[Unreleased]` section first.

3. Move `[Unreleased]` changes to a versioned section **before release**.

4. Keep descriptions clear, concise, and actionable.

5. Ensure all added or changed scripts include **usage instructions** in README.md.

---

**Author:** Jonathan Tambe  
**Role Target:** Senior DevOps / Cloud Engineer

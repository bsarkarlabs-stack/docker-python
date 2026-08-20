FROM python:3.12-slim-bookworm

# System package updates
# Note: All CRITICAL and HIGH vulnerabilities in base packages are awaiting
# upstream fixes (see REMEDIATION-SUMMARY.txt for details)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Fix pip vulnerabilities (CVE-2026-1703, CVE-2026-8643, CVE-2025-8869, CVE-2026-3219, CVE-2026-6357)
# Upgrade pip to 26.1.2 which fixes all identified pip vulnerabilities
RUN python -m pip install --upgrade pip==26.1.2

ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

CMD ["python", "--version"]

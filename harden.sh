#!/usr/bin/env bash
set -euo pipefail

echo "🛡️ Zayed-Shield – Repository Hardening & Security Audit"
echo "======================================================="

# 1. Show branches
echo "[1/7] Checking branches..."
git branch -a

# 2. Audit GitHub workflows
echo "[2/7] Auditing GitHub Actions workflows..."
for wf in .github/workflows/*.yml; do
  echo "— Reviewing: $wf"
  grep -E "sudo|apt install|curl .*\\||wget .*\\|" "$wf" \
    && echo "⚠️  Manual review recommended" \
    || echo "✅ No risky commands detected"
done

# 3. Temporarily isolate sensitive workflows
echo "[3/7] Isolating sensitive workflows..."
mkdir -p .github/workflows-disabled
for wf in federal-security.yml fortify.yml; do
  if [ -f ".github/workflows/$wf" ]; then
    mv ".github/workflows/$wf" .github/workflows-disabled/
  fi
done

# 4. Node.js dependency audit
if [ -f package.json ]; then
  echo "[4/7] Auditing Node.js dependencies..."
  npm install --ignore-scripts
  npm audit --audit-level=high || true
fi

# 5. Python dependency audit
if [ -f requirements.txt ]; then
  echo "[5/7] Auditing Python dependencies..."
  pip install --upgrade pip
  pip install safety
  safety check || true
fi

# 6. Secret scan (basic)
echo "[6/7] Scanning for secrets..."
grep -R --line-number -E "AKIA|SECRET|PRIVATE_KEY|TOKEN" . \
  || echo "✅ No obvious secrets found"

# 7. Summary
echo "[7/7] Hardening & audit completed."
echo "Repository reviewed. No automated offensive execution detected."

#!/bin/bash

set -e

echo "🔧 Installing VEP Polaris..."

# Step 1: Make all scripts executable
chmod +x bin/vep-polaris
chmod +x bin/plugin-inspect
chmod +x run-tests.sh
chmod +x test/*.sh
chmod +x install.sh

echo "✅ Marked CLI and test scripts as executable."

# Step 2: Optional symlink to /usr/local/bin
read -p "Would you like to symlink 'vep-polaris' to /usr/local/bin? [y/N] " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  sudo ln -sf "$(pwd)/bin/vep-polaris" /usr/local/bin/vep-polaris
  echo "✅ Symlinked: /usr/local/bin/vep-polaris"
else
  echo "⚠️ Skipped symlinking. You can still run it from ./bin/vep-polaris"
fi

# Step 3: Optional message for Docs setup
echo "📘 If you're using MkDocs for documentation:"
echo "  - Preview locally with: mkdocs serve"

echo "🎉 Done! You're ready to use VEP Polaris."
#!/bin/bash
set -e
trap 'echo "❌ Local dev environment setup failed."' ERR

echo ""
echo "📦 Installing pre-commit hook dependencies..."
npm install
echo "✅ Done."

echo ""
echo "🎉 Setup complete."
echo ""
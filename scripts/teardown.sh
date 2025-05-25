#!/bin/bash

echo ""
echo "🛑 Stopping server..."
pkill -f market-service || true
echo "✅ Done."

echo ""
echo "🎉 Microservice torn down."
echo ""
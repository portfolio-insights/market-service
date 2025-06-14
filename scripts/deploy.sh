#!/bin/bash
set -e
trap 'echo "❌ Deployment failed."' ERR

echo ""
echo "🛑 Stopping existing microservice deployment ..."
pkill -f market-service || true
echo "✅ Done."

echo ""
echo "🧹 Deleting previous log file..."
rm -f market.log
echo "✅ Done."

echo ""
echo "⚒️ Building new executable..."
go build -o market-service ./src
echo "✅ Done."

echo ""
echo "🚀 Running executable..."
nohup ./market-service >> market.log 2>&1 &
echo "✅ Done."

# Run health check
echo ""
echo "🔍 Verifying health endpoint..."
# Wait for service to be ready (max 10 seconds, retry every 0.5s)
for i in {1..20}; do
  if curl --fail --silent http://localhost:8080/health; then
    echo ""
    echo ""
    echo "🎉 Microservice up and running."
    echo ""
    exit 0
  fi
  sleep 0.5
done
echo ""
echo ""
echo "❌ Health check failed. Microservice did not start correctly."
echo ""
exit 1
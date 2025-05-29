#!/bin/bash

echo ""
echo "🛑 Stopping existing microservice deployment ..."
pkill -f market-service || true
echo "✅ Done."

echo ""
echo "⚒️ Building new executable..."
go build -o market-service
echo "✅ Done."

echo ""
echo "🚀 Running executable..."
nohup ./market-service >> market.log 2>&1 &
echo "✅ Done."

echo ""
echo "🎉 Microservice up and running."
echo ""
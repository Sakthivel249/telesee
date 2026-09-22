#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# TG Online Tracker — Install & Enable Service
# Run AFTER copying project files to /opt/tg-tracker
# ═══════════════════════════════════════════════════════════════

set -e
cd /opt/tg-tracker

echo "🐍 Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "📦 Installing Python packages..."
pip install --upgrade pip
pip install -r requirements.txt

echo "📁 Creating data directory..."
mkdir -p data

echo "⚙️ Installing systemd service..."
sudo cp deploy/tg-tracker.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable tg-tracker
sudo systemctl start tg-tracker

echo ""
echo "✅ Done! Bot is now running as a system service."
echo ""
echo "📋 Useful commands:"
echo "   sudo systemctl status tg-tracker    — Check status"
echo "   sudo systemctl restart tg-tracker   — Restart bot"
echo "   sudo systemctl stop tg-tracker      — Stop bot"
echo "   sudo journalctl -u tg-tracker -f    — View live logs"
echo ""

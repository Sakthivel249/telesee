#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# TG Online Tracker — Oracle Cloud Setup Script
# Run this on your Oracle Cloud Ubuntu instance
# ═══════════════════════════════════════════════════════════════

set -e

echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing Python & dependencies..."
sudo apt install -y python3 python3-pip python3-venv git

echo "📂 Setting up project directory..."
sudo mkdir -p /opt/tg-tracker
sudo chown $USER:$USER /opt/tg-tracker

echo "📋 Copy your project files to /opt/tg-tracker first!"
echo "   Use: scp -r ./* user@your-server-ip:/opt/tg-tracker/"
echo ""
echo "After copying files, run: bash /opt/tg-tracker/deploy/install.sh"

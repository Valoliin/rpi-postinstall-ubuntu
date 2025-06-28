#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "❌ Ce script doit être exécuté avec sudo."
  exit 1
fi

echo "=== 🛠️ Script de post-installation Ubuntu pour Raspberry Pi 5 ==="

# Mise à jour du système
echo "📦 Mise à jour des paquets..."
apt update && apt upgrade -y

# Installation des outils essentiels
echo "🧰 Installation des outils utiles..."
apt install -y \
  wget git htop neofetch net-tools \
  build-essential software-properties-common

# Installation de l’environnement de bureau Ubuntu MATE
echo "🖥️ Installation du bureau Ubuntu MATE..."
apt install -y ubuntu-mate-desktop

echo "✅ Installation terminée ! Tu peux redémarrer avec : sudo reboot"

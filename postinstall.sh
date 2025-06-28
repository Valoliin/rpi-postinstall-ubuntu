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
  build-essential software-properties-common python3-pip

# Installation du bureau Ubuntu optimisé Raspberry Pi
echo "🖥️ Installation du bureau Ubuntu Desktop (raspi optimisé)..."
echo "ℹ️ Lors de l'installation, choisis **lightdm** si le système te le demande."
apt install -y ubuntu-desktop-raspi

# Installation de xpra
echo "📺 Installation de xpra (avec support HTML5)..."
apt install -y xpra

# Récupération du dashboard depuis GitHub
echo "🌐 Clonage du dashboard depuis GitHub..."
mkdir -p /opt
rm -rf /opt/dashboard
git clone https://github.com/Valoliin/rpi-postinstall-ubuntu-dashboard.git /opt/dashboard

# Installation de Flask
echo "🐍 Création d’un environnement virtuel pour Flask..."
python3 -m venv /opt/dashboard/venv
source /opt/dashboard/venv/bin/activate
/opt/dashboard/venv/bin/pip install flask


# Création du service systemd
echo "🛠️ Création du service systemd pour le dashboard..."
cat << 'EOF' > /etc/systemd/system/dashboard.service
[Unit]
Description=Dashboard Raspberry Pi (Flask)
After=network.target

[Service]
User=pi
WorkingDirectory=/opt/dashboard
ExecStart=/opt/dashboard/venv/bin/python /opt/dashboard/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Activation du service
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable dashboard.service
systemctl start dashboard.service

echo "✅ Installation terminée !"
echo "🌍 Accède au dashboard sur : http://<IP_DE_TA_PI>:5000"
echo "📎 Place tes icônes PNG dans /opt/dashboard/static/ si besoin"
echo "🔁 Redémarre si nécessaire avec : sudo reboot"

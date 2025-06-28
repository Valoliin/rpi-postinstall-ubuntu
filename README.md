# 🚀 Script de Post-installation Ubuntu pour Raspberry Pi 5

Ce script configure automatiquement un Raspberry Pi 5 fraîchement installé avec **Ubuntu Server** (22.04 ou 24.04) pour en faire une station de travail complète avec bureau **Ubuntu MATE**.

---

## ✅ Ce que fait le script

- Met à jour le système
- Installe les outils essentiels : `git`, `htop`, `neofetch`, etc.
- Installe l’environnement de bureau **Ubuntu MATE**

---

## 🧪 Pré-requis

- Raspberry Pi 5 avec **Ubuntu Server** déjà installé (par exemple avec le script [rpi-boot-ubuntu-nvme](https://github.com/Valoliin/rpi-boot-ubuntu-nvme))
- Accès Internet
- Compte utilisateur avec `sudo` activé (ex. `ubuntu`)

---

## 📦 Installation en une ligne

```bash
curl -sSL https://raw.githubusercontent.com/Valoliin/rpi-postinstall-ubuntu/main/postinstall.sh | sudo bash
````

---

## 🔄 Redémarrage

Une fois l’installation terminée :

```bash
sudo reboot
```

> Après redémarrage, l’environnement graphique Ubuntu MATE sera accessible.

---

## 📁 Fichiers dans ce dépôt

| Fichier          | Rôle                                  |
| ---------------- | ------------------------------------- |
| `postinstall.sh` | Script principal de post-installation |
| `README.md`      | Documentation                         |

---

## 🙌 Auteur

Maintenu par [Valoliin](https://github.com/Valoliin)

```

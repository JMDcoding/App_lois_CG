#!/bin/bash
# Script d'installation de Flutter et de compilation pour Vercel

echo "📥 Téléchargement de Flutter..."
git clone https://github.com/flutter/flutter.git -b stable

echo "⚙️ Configuration du PATH..."
export PATH="$PATH:`pwd`/flutter/bin"

echo "🛠️ Activation du support Web..."
flutter config --enable-web

echo "📦 Installation des dépendances..."
flutter pub get

echo "🚀 Compilation de l'application Web..."
flutter build web --release

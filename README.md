# Mobeko 🇨🇬

**Mobeko** (qui signifie "La Loi" en Lingala) est un assistant juridique intelligent spécialement conçu pour la République du Congo. 
Notre mission est de démocratiser l'accès au droit en rendant les lois, les démarches administratives et les droits civiques accessibles, compréhensibles et consultables par tous les citoyens, à tout moment et en plusieurs langues.

## 🚀 Fonctionnalités Principales
- **Bibliothèque Juridique :** Consultez les lois congolaises classées par catégories (Travail, Famille, Logement, etc.).
- **Assistant Virtuel IA :** Posez vos questions juridiques complexes et recevez des réponses claires.
- **Générateur de Documents :** Créez automatiquement des documents administratifs (lettres, contrats).
- **Scanner de Documents :** Analysez des documents officiels pour en comprendre le contenu.
- **Accès d'Urgence :** Retrouvez instantanément vos droits en cas de situation urgente (arrestation, accident, litige).
- **Multilingue :** Disponible en Français, Anglais, Lingala et Kituba.
- **Mode Hors Ligne :** Accédez à vos documents sauvegardés sans connexion internet.

## 🛠 Technologies Utilisées
- **Framework :** Flutter (Multiplateforme)
- **Gestion d'État :** Riverpod
- **Base de Données / Backend :** Firebase (Auth, Firestore, Storage)
- **Stockage Local :** Hive & SharedPreferences
- **Intelligence Artificielle :** Gemini (Google Generative AI)

## 🌐 Déploiement Web (Vercel)
Il est tout à fait possible de compiler et de déployer cette application sur le Web à l'aide de Vercel.

### 1. Compiler l'application pour le Web
Assurez-vous que Flutter est installé et configuré pour le web, puis exécutez la commande suivante à la racine du projet :
```bash
flutter build web --release
```
Cela générera les fichiers statiques de votre site web dans le dossier `build/web`.

### 2. Déployer sur Vercel
- Installez le Vercel CLI si ce n'est pas déjà fait : `npm i -g vercel`.
- Allez dans le dossier généré : `cd build/web`.
- Exécutez la commande `vercel` et suivez les instructions à l'écran pour déployer le site publiquement.

## 📱 Compilation Mobile (Android)
Pour générer l'APK de l'application (pour téléphones Android) :
```bash
flutter build apk --release
```
Le fichier `.apk` se trouvera dans `build/app/outputs/flutter-apk/`.

## 🤝 Contribution
Nous accueillons avec grand plaisir toutes les contributions ! 
1. **Forkez** le projet
2. **Créez votre branche** (`git checkout -b feature/NouvelleFonctionnalite`)
3. **Commitez vos changements** (`git commit -m 'Ajout d'une nouvelle fonctionnalité'`)
4. **Pushez vers la branche** (`git push origin feature/NouvelleFonctionnalite`)
5. **Ouvrez une Pull Request**

## 📜 Licence
Ce projet est sous licence MIT - voir le fichier LICENSE pour plus de détails.

---
*Fait avec ❤️ pour la République du Congo.*

# 📑 Spécification du Descripteur de Projet (M-SPEC-001)

## 📜 Statut : Immuable / Contrat de Service

Ce document définit le contrat entre l'utilisateur et l'écosystème M-CORE. Toute modification du schéma JSON `project.schema.json` doit impérativement être répercutée dans le modèle Go de l'Engine.

## 🏗️ Structure & Flexibilité

Le descripteur s'adapte à la topologie du dépôt :
- **Composite** : Nécessite la définition du tableau `modules`. Utilisé pour les dépôts "Umbrella" (Conteneurs).
- **Standalone** : Le tableau `modules` est facultatif. Utilisé pour les dépôts "Feuilles" (Simples).

## 🔐 Personnalisation & Immuabilité

1. **Loi du Projet** : Le fichier `project.mcore.yml` définit la structure macro.
2. **Liberté Utilisateur** : Pour personnaliser l'environnement local sans briser le contrat M-SPEC, l'utilisateur **doit** utiliser les fichiers `.env`.
 
3. **Priorité** : L'Engine scanne les `.env` pour surcharger les variables de base, garantissant un fonctionnement immuable des fonctionnalités socles tout en offrant une souplesse locale.

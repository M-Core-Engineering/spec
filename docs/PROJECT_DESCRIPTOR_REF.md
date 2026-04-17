# 📖 Référence du Descripteur de Projet (project.mcore.yml)

Ce document détaille les spécifications techniques et les contraintes de validation du fichier `project.mcore.yml`.

## 🏗️ Structure Globale

| Attribut | Type | Obligatoire | Description |
| :--- | :--- | :--- | :--- |
| `version` | String | Oui | Version du schéma (numérique). |
| `project` | Object | Oui | Métadonnées d'identité du projet. |
| `remotes` | Object | Oui | Configuration des accès distants (VCS). |
| `modules` | Array | Conditionnel | Liste des sous-composants (requis si topology=composite). |

---

## 🔍 Détails des Attributs

### Section `project`

* **`owner_type`** (`enum: [org, user]`) : Définit si le propriétaire est une organisation GitHub ou un profil individuel. Impacte la construction des URLs de profils.
* **`topology`** (`enum: [composite, standalone]`) : 
  * `composite` : Projet parent gérant des dépendances internes.
  * `standalone` : Projet feuille, autonome et sans sous-modules.
* **`vcs_driver`** (`enum: [git, gh-cli, gl-cli]`) : Définit l'interface de commande utilisée par l'Engine pour les opérations de synchronisation.

### Section `remotes`

* **`provider`** (`pattern`): Nom d'hôte du service (ex: `github.com`). La validation impose un format FQDN valide.
* **`protocol`** (`enum: [https, ssh]`): Définit le mode de transport des données. **Note :** Le passage de l'un à l'autre est transparent pour l'Engine.

### Section `modules`

* **`path`** (`pattern: ^\./`): Impose l'usage de chemins relatifs commençant par `./`. C'est une mesure de sécurité stricte pour garantir la portabilité (Windows/Android/Linux).
* **`visibility`** (`enum: [public, private]`): Utilisé par l'orchestrateur pour décider des méthodes d'authentification (Tokens vs Public Clone).

---

## 🛡️ Règles de Validation Stricte

- **Unicité** : Deux modules ne peuvent pas avoir le même nom ou le même chemin (`uniqueItems: true`).
- **Immuabilité** : Aucune propriété supplémentaire n'est autorisée (`additionalProperties: false`) pour éviter les "configurations fantômes" non gérées par l'Engine.

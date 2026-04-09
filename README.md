# ⚙️ M-CORE Engine (Core Rendering Engine)

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Rust: Stable](https://img.shields.io/badge/Rust-Stable-orange.svg)](https://www.rust-lang.org/)
[![CI: Release Engine](https://github.com/M-Core-Engineering/engine/actions/workflows/release.yml/badge.svg)](https://github.com/M-Core-Engineering/engine/actions)

**M-CORE Engine** est le cœur de traitement de l'écosystème M-CORE. Développé en **Rust** pour des performances et une sécurité mémoire optimales, ce binaire est chargé de la transformation des fichiers sources Markdown en formats industriels (HTML interactif, PDF Typst, JSON).

---

## 🛠️ Pré-requis de l'Environnement

Pour contribuer ou compiler ce moteur, vous devez disposer des outils suivants :

| Outil | Version Min. | Usage |
| :--- | :--- | :--- |
| **Rustup / Cargo** | 1.75+ | Compilation et gestion des dépendances Rust. |
| **Go-Task** | 3.0+ | Orchestration des tâches de build (recommandé). |
| **Git** | 2.0+ | Gestion du code source. |

---

## 🏗️ Guide de Compilation (Local)

### 1. Clonage du projet

```bash
git clone [https://github.com/M-Core-Engineering/engine.git](https://github.com/M-Core-Engineering/engine.git)
cd engine
```

### 2. Compilation via Cargo (Méthode Standard)

Pour une utilisation locale simple :

```bash
cargo build
```

Pour générer le binaire optimisé (Production) :

```bash
cargo build --release
```

Le binaire sera généré dans `target/release/m-core-engine`.

### 3. Compilation via Task (Méthode M-CORE)

Si vous avez installé notre [Taskfile global](../Taskfile.yml) :

```bash
task build
```

---

## 🧪 Tests et Qualité

Avant chaque soumission (Pull Request), vous devez valider l'intégrité du code :

* **Unit Tests** : `cargo test`
* **Formatage** : `cargo fmt --check` (Respect strict de la syntaxe Rust).
* **Analyse Statique** : `cargo clippy` (Vérification des bonnes pratiques).

---

## 🚀 Pipeline de Release (CI/CD)

Ce dépôt utilise une **GitHub Action** automatisée. Toute création de tag respectant la nomenclature `v*` (ex: `v1.0.0`) déclenchera :

1. La compilation croisée (Windows / Linux).
2. La création d'une **GitHub Release**.
3. L'attachement des binaires statiques.

**Pour publier une nouvelle version :**

```bash
git tag -a v1.x.x -m "Description de la version"
git push origin v1.x.x
```

---

## 🛡️ Architecture & Sécurité

* **Zéro Dépendance non-vérifiée** : Toute nouvelle crate ajoutée au `Cargo.toml` doit être auditée.
* **Herméticité** : Le moteur doit pouvoir fonctionner en mode **Offline-First**, sans aucun appel réseau durant le rendu.

---
**Mainteneur :** Nguetsa Lorein Du Perron (M-Core Engineering)  
**Licence :** [Apache-2.0](LICENSE)

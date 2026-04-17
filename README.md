# 📚 M-CORE Spec (Governance & Schemas)

**Le dépôt souverain des normes, schémas de données et modèles de l'écosystème.**

## 🎯 Rôle

Le module `spec` agit comme la **Source de Vérité** de l'organisation. Il ne contient aucun code exécutable (hormis des tâches de validation), mais définit les contrats techniques auxquels tous les autres modules (`engine`, `mobile`, etc.) doivent se conformer.

## 📂 Organisation

*   **`/schema`** : Contient les JSON Schemas (Draft 2020-12) définissant la structure stricte des fichiers de configuration.
*   **`/local`** : Contient les modèles de base (`_project.yml`, `.env.metadata`) utilisés pour l'initialisation des nouveaux environnements de travail.
*   **`/docs`** : Documentation détaillée des standards de nommage et des protocoles de données.

## 🛡️ Validation

Tout descripteur `project.mcore.yml` doit être validé contre `project.schema.json` avant d'être traité par le moteur `engine`. Cette validation garantit :

1.  La **portabilité** (chemins relatifs forcés).
2.  La **sécurité** (protocoles VCS restreints).
3.  L'**intégrité** (champs obligatoires présents).

---

© 2026 **M-CORE Engineering** | *Standards defined, Resilience guaranteed.*

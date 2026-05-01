---
description: "Architecture applicative en couches centrée domaine : ports/adapters, dépendances orientées domaine, pas de framework dans le métier. Auto-activée sur les dossiers source."
paths:
  - "**/src/**"
  - "**/lib/**"
  - "**/app/**"
  - "**/internal/**"
  - "**/pkg/**"
  - "**/cmd/**"
---

Objectif: Protéger le domaine des frameworks, I/O et persistance.
Portée: Structure du projet, modules, use-cases et dépendances.

Règles:
- Orienter les dépendances vers le domaine (frameworks → adapters → use-cases → domaine).
- Aucun import de framework, DB ou HTTP dans le domaine.
- Logique métier dans domaine / use-cases, pas dans controllers.
- Pas de SQL dans le domaine; pas d'appels HTTP bruts dans les use-cases.
- Passer toute dépendance externe via une interface (port) explicite.
- Injecter les implémentations concrètes; ne pas les instancier dans le domaine.
- Éviter état global mutable et singletons cachés.
- Traiter tout import circulaire comme un bug d'architecture.
- Documenter tout changement structurel dans la memory-bank (architecture + decisions).

---
description: "Sécurité applicative : secrets, validation des entrées, SQL, désérialisation, logs. Auto-activée sur les dossiers source et auth."
paths:
  - "**/src/**"
  - "**/lib/**"
  - "**/app/**"
  - "**/internal/**"
  - "**/pkg/**"
  - "**/cmd/**"
  - "**/auth/**"
  - "**/*auth*"
---

Objectif: Protéger secrets et données, limiter injections.
Portée: Tout code manipulant entrées externes ou données sensibles.

Règles:
- Aucun secret en clair dans code, tests, logs, exemples ou commits.
- Stocker les secrets via env / secret manager + fichiers d'exemple seulement.
- Valider toute entrée externe à la frontière (HTTP, CLI, fichiers, messages).
- Traiter un échec de validation comme une erreur explicite, jamais silencieuse.
- Utiliser des paramètres liés pour le SQL; bannir la concaténation.
- Ne jamais construire de commandes système avec entrées non échappées.
- Éviter désérialisation / évaluation dynamiques sur des données non fiables.
- Interdire toute PII, tokens ou mots de passe dans les logs.
- En prod, n'utiliser que des canaux chiffrés pour données sensibles.
- Éviter les comptes applicatifs avec droits d'admin globale.

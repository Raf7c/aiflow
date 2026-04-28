---
description: "Sécurité applicative : secrets, validation d'inputs, anti-injection, logs propres."
alwaysApply: true
---

- Jamais de secret en clair dans le code, les commits, les logs, les tests, les exemples.
- Secrets via variables d'environnement ou secret manager ; fichier d'exemple versionné, fichier réel jamais.
- Tout input externe (HTTP, CLI, fichier, message, variable d'environnement) validé à la frontière avant traitement.
- Échec de validation = erreur explicite, jamais de comportement par défaut silencieux.
- Requêtes vers une base de données : paramètres liés, jamais de concaténation de strings.
- Commandes système : pas d'interpolation de variables non échappées.
- Pas de désérialisation de format exécutable ou évalué dynamiquement sur input externe.
- Pas de PII, tokens, mots de passe ou clés API dans les logs (même tronqués).
- Pas de protocoles non chiffrés en production.
- Pas d'utilisateur applicatif avec droits administrateur ou de modification de schéma en production.

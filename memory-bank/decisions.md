# Decisions

<!--
But : journal append-only des décisions techniques structurantes.
Format ADR (Architecture Decision Record) simplifié.
Une entrée = une décision. Jamais réécrit. Si une décision est annulée,
on ajoute une nouvelle entrée qui mentionne "remplace YYYY-MM-DD-titre".

Quand ajouter une entrée :
- Choix de stack ou de framework
- Choix d'architecture (couches, patterns)
- Choix d'intégration externe
- Renoncement à une approche après tentative
- Tout choix dont on devra se souvenir du "pourquoi" dans 6 mois

Quand NE PAS ajouter d'entrée :
- Détails d'implémentation triviaux
- Choix réversibles sans coût
- Conventions de code (vont dans rules/ ou conventions projet)

Densité : sans limite, on append. Mais chaque entrée reste courte (≤ 20 lignes).
-->

<!--
Format d'une entrée :

## YYYY-MM-DD — Titre court de la décision

**Statut** : proposée | acceptée | dépréciée | remplacée par YYYY-MM-DD-autre-titre

**Contexte**
2-4 lignes décrivant la situation qui a amené cette décision.
Quel problème, quelles contraintes, quel moment du projet.

**Décision**
1-3 lignes décrivant ce qui a été choisi.
Direct, sans justification ici (la justification est dans Conséquences et Alternatives).

**Conséquences**
2-4 lignes : ce que cette décision implique.
Inclure le positif ET le négatif. Coûts, contraintes nouvelles, simplifications gagnées.

**Alternatives considérées**
1-3 lignes : ce qu'on a envisagé et pourquoi rejeté.

---
-->

<!--
Exemple à supprimer lors de la première entrée réelle :

## 2026-04-15 — Adoption de FastAPI plutôt que Flask

**Statut** : acceptée

**Contexte**
Démarrage du projet acme-api. Besoin d'une API REST avec validation
de schémas forte et documentation OpenAPI auto-générée. Équipe de 2
développeurs, livraison du MVP visée en 6 semaines.

**Décision**
Utiliser FastAPI 0.110 comme framework HTTP principal.

**Conséquences**
+ Validation Pydantic native, OpenAPI gratuit.
+ Async natif, utile pour les appels Stripe/Mailjet.
- Écosystème plus jeune que Flask, moins d'extensions matures.
- Courbe d'apprentissage Pydantic v2 pour l'équipe.

**Alternatives considérées**
- Flask : écosystème mature mais validation manuelle, OpenAPI à brancher.
- Django REST Framework : trop lourd pour un service de cette taille.

---
-->

<!--
Première entrée réelle ci-dessous. Supprimer l'exemple ci-dessus.
-->

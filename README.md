# 🏦 NeoBank Project

Projet SQL de modélisation d’une base de données pour une néobanque.

Ce projet simule la structure d’un système bancaire incluant la gestion :

- des clients
- des comptes bancaires
- des transactions
- des cartes bancaires
- des virements
- des bénéficiaires
- des alertes fraude
- des limites de transaction
- des logs d’audit
- des sessions de connexion

---

## 📁 Structure du projet
NeoBankProject/
│
├── table_creation.sql # Script de création des tables
├── values_insert.sql # Script d’insertion de données de test
└── README.md


---

## 🧱 Modèle de données

### Entités principales

- `customers`
- `accounts`
- `transactions`
- `transaction_types`
- `credit_cards`
- `beneficiary`
- `fraud_alerts`
- `transaction_limits`
- `audit_logs`
- `session_login`

Le modèle respecte :
- les clés primaires
- les clés étrangères
- les contraintes CHECK
- l’intégrité référentielle

---

## ⚙️ Installation & Exécution

### 1️⃣ Créer la base de données

```bash
mysql -u root -p
```

Puis dans MySQL :

```bash
CREATE DATABASE neobank_project;
EXIT;
```

## 2️⃣ Créer les tables

```bash
mysql -u root -p neobank_project < table_creation.sql
```

## 3️⃣ Insérer les données de test

```bash
mysql -u root -p neobank_project < values_insert.sql
```

## 🛠️ Technologies

MySQL 8+
SQL standard (constraints, foreign keys, checks)

## 🎯 Objectif pédagogique

Ce projet a pour objectif de :
-pratiquer la modélisation relationnelle
-implémenter des contraintes d’intégrité
-structurer un schéma bancaire cohérent
-manipuler des relations complexes (1-N, N-1)

## 👤 Auteurs

Projet réalisé dans le cadre du Master 1 Dev&Data dans le module SQL par Nassim et Kévin.
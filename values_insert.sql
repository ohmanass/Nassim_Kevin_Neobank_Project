-- =========================
-- CUSTOMERS
-- =========================
INSERT INTO customers (last_name, name, email, phone_number, birth_date, status)
VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', '0612345678', '1985-04-12', 'actif'),
('Martin', 'Claire', 'claire.martin@email.com', '0678451236', '1990-09-22', 'actif'),
('Bernard', 'Lucas', 'lucas.bernard@email.com', '0654789123', '1978-01-30', 'suspendu'),
('Petit', 'Sophie', 'sophie.petit@email.com', '0622334455', '1992-03-14', 'actif'),
('Moreau', 'Pierre', 'pierre.moreau@email.com', '0611223344', '1980-07-07', 'actif'),
('Laurent', 'Emilie', 'emilie.laurent@email.com', '0688776655', '1988-11-19', 'actif'),
('Roux', 'Antoine', 'antoine.roux@email.com', '0677991122', '1995-05-05', 'actif'),
('Fournier', 'Isabelle', 'isabelle.fournier@email.com', '0699887766', '1983-08-21', 'actif'),
('Mercier', 'Thomas', 'thomas.mercier@email.com', '0612349876', '1975-02-02', 'ferme'),
('Girard', 'Julie', 'julie.girard@email.com', '0623456789', '1991-06-12', 'actif'),
('Lambert', 'Vincent', 'vincent.lambert@email.com', '0634567890', '1987-09-30', 'actif'),
('Fontaine', 'Alice', 'alice.fontaine@email.com', '0645678901', '1993-01-25', 'actif'),
('Chevalier', 'Marc', 'marc.chevalier@email.com', '0656789012', '1979-12-11', 'suspendu'),
('Blanc', 'Claire', 'claire.blanc@email.com', '0667890123', '1996-04-04', 'actif'),
('Gauthier', 'Nicolas', 'nicolas.gauthier@email.com', '0678901234', '1982-10-10', 'actif');

-- =========================
-- ACCOUNTS
-- =========================
INSERT INTO accounts (account_number, customer_id, account_type, balance, currency, status)
VALUES
('FR7612345678901234567890123', 1, 'current', 5000.00, 'EUR', 'active'),
('FR7612345678901234567890456', 1, 'epargne', 12000.00, 'EUR', 'active'),
('FR7612345678901234567890789', 2, 'current', 3000.00, 'EUR', 'active'),
('FR7612345678901234567890999', 3, 'current', 1500.00, 'EUR', 'blocked'),
('FR7612345678901234567891111', 4, 'current', 2500.00, 'EUR', 'active'),
('FR7612345678901234567891222', 5, 'epargne', 8000.00, 'EUR', 'active'),
('FR7612345678901234567891333', 6, 'current', 4000.00, 'EUR', 'active'),
('FR7612345678901234567891444', 7, 'current', 3500.00, 'EUR', 'active'),
('FR7612345678901234567891555', 8, 'epargne', 15000.00, 'EUR', 'active'),
('FR7612345678901234567891666', 9, 'current', 500.00, 'EUR', 'close'),
('FR7612345678901234567891777', 10, 'current', 2200.00, 'EUR', 'active'),
('FR7612345678901234567891888', 11, 'epargne', 9000.00, 'EUR', 'active'),
('FR7612345678901234567891999', 12, 'current', 3200.00, 'EUR', 'active'),
('FR7612345678901234567892000', 13, 'current', 600.00, 'EUR', 'blocked'),
('FR7612345678901234567892111', 14, 'current', 7800.00, 'EUR', 'active');

-- =========================
-- TRANSACTION TYPES
-- =========================
INSERT INTO transaction_types (wording, description)
VALUES
('transfer', 'Bank transfer'),
('withdrawal', 'ATM withdrawal'),
('deposit', 'Cash deposit'),
('card_payment', 'Payment by credit card');

-- =========================
-- TRANSACTIONS
-- =========================
INSERT INTO transactions (source_account_id, destination_account_id, transaction_type_id, amount, status, reference_externe)
VALUES
(1, 3, 1, 500.00, 'successful', 'REF001'),
(3, 1, 1, 200.00, 'successful', 'REF002'),
(1, 1, 2, 100.00, 'successful', 'ATM001'),
(2, 1, 3, 1000.00, 'pending', 'DEP001'),
(3, 4, 1, 250.00, 'declined', 'REF003'),
(5, 2, 1, 400.00, 'successful', 'REF004'),
(6, 7, 1, 600.00, 'successful', 'REF005'),
(8, 5, 1, 1000.00, 'successful', 'REF006'),
(9, 10, 2, 150.00, 'successful', 'ATM002'),
(11, 12, 3, 2000.00, 'successful', 'DEP002'),
(13, 14, 1, 300.00, 'successful', 'REF007');

-- =========================
-- CREDIT CARDS
-- =========================
INSERT INTO credit_cards (number_card, account_id, card_type, expiration_date, payment_ceiling, withdrawal_limit, status)
VALUES
('1234567812345678', 1, 'VISA', '2027-12-31', 3000.00, 1000.00, 'active'),
('8765432187654321', 3, 'MASTERCARD', '2026-06-30', 2000.00, 800.00, 'active'),
('2345678923456789', 5, 'VISA', '2028-11-30', 2500.00, 900.00, 'active');

-- =========================
-- CREDIT CARD PAYMENTS
-- =========================
INSERT INTO credit_card_payment (transaction_id, credit_card_id)
VALUES
(1, 1),
(2, 2),
(6, 3);

-- =========================
-- WIRE BANK
-- =========================
INSERT INTO wire_bank (reference, pattern, transaction_id)
VALUES
('WIRE001', 'SEPA', 1),
('WIRE002', 'SEPA', 2),
('WIRE003', 'SWIFT', 6);

-- =========================
-- BENEFICIARIES
-- =========================
INSERT INTO beneficiary (name, iban, bank, customer_id)
VALUES
('Société ABC', 'FR7630006000011234567890189', 'BNP Paribas', 1),
('Entreprise XYZ', 'FR7630006000019876543210456', 'Société Générale', 2),
('Startup DEF', 'FR7630006000015555555555555', 'Crédit Agricole', 5);

-- =========================
-- FRAUD ALERTS
-- =========================
INSERT INTO fraud_alerts (risk_score, status, transaction_id)
VALUES
(85, 'open', 5),
(40, 'closed', 1),
(70, 'under_review', 6);

-- =========================
-- TRANSACTION LIMITS
-- =========================
INSERT INTO transaction_limits (daily_limit, monthly_limit, account_id)
VALUES
(2000.00, 10000.00, 1),
(1500.00, 8000.00, 3),
(2500.00, 12000.00, 5);

-- =========================
-- AUDIT LOGS
-- =========================
INSERT INTO audit_logs (table_concerned, recording_id, operation_type, users, old_value, new_value)
VALUES
('accounts', 1, 'UPDATE', 'admin', 'balance: 4500', 'balance: 5000'),
('transactions', 5, 'INSERT', 'system', 'NULL', 'transaction created');

-- =========================
-- SESSION LOGIN
-- =========================
INSERT INTO session_login (ip_address, device, customer_id)
VALUES
('192.168.1.10', 'Chrome - Windows', 1),
('192.168.1.15', 'Safari - iPhone', 2),
('192.168.1.20', 'Firefox - Linux', 5);

-- ---------------- Etape 3 ----------------
-- Top 10 Clients Par volume total de transactions
SELECT 
    c.customer_id,
    c.last_name,
    c.name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_volume
    FROM customers c
    JOIN accounts a 
        ON c.customer_id = a.customer_id
    JOIN transactions t 
        ON t.source_account_id = a.account_id
    WHERE t.status = 'successful'
    GROUP BY c.customer_id, c.last_name, c.name
    ORDER BY total_transactions DESC
    LIMIT 10;

-- Analyse mensuelle des volumes et fréquences de dépôts.
WITH deposit_transactions AS (
    SELECT
        t.source_account_id,
        t.amount,
        t.transaction_date
    FROM transactions t
    JOIN transaction_types tt
        ON t.transaction_type_id = tt.transaction_type_id
    WHERE tt.wording = 'deposit'
      AND MONTH(t.transaction_date) = MONTH(CURRENT_DATE)
),

customer_accounts AS (
    SELECT
        c.customer_id,
        c.last_name,
        c.name,
        a.account_id
    FROM customers c
    JOIN accounts a
        ON c.customer_id = a.customer_id
),

customer_monthly_volume AS (
    SELECT
        ca.customer_id,
        ca.last_name,
        ca.name,
        SUM(dt.amount) AS monthly_volume
    FROM customer_accounts ca
    JOIN deposit_transactions dt
        ON dt.source_account_id = ca.account_id
    GROUP BY
        ca.customer_id,
        ca.last_name,
        ca.name
)

SELECT *
FROM customer_monthly_volume
ORDER BY monthly_volume DESC;

-- Mises en place des 3 regles de securite du compte 
SELECT 
    t.transaction_id, 
    t.amount, 
    tl.daily_limit
FROM transactions t
JOIN transaction_limits tl 
    ON t.source_account_id = tl.account_id
WHERE t.amount > tl.daily_limit
AND t.status = 'successful';

SELECT 
    source_account_id, 
    COUNT(*) nb_tx
FROM transactions
WHERE transaction_date >= NOW() - INTERVAL 10 MINUTE
GROUP BY source_account_id
HAVING COUNT(*) >= 5;

SELECT 
    t.transaction_id, 
    t.amount, 
    cc.payment_ceiling
FROM transactions t
JOIN credit_card_payment ccp 
    ON ccp.transaction_id = t.transaction_id
JOIN credit_cards cc 
    ON cc.card_id = ccp.credit_card_id
WHERE t.amount > cc.payment_ceiling;

START TRANSACTION;
UPDATE accounts
SET balance = balance - 100
WHERE account_id = 3

-- Procedure de virements
IF ROW_COUNT() > 0 THEN;
   UPDATE accounts
    SET balance = balance + 100
    WHERE account_id = 4;
COMMIT;
ELSE
    ROLLBACK;
END IF;

-- Créer des Index
-- Implémenter au moins 3 index stratégiques pour améliorer les 
-- requêtes lentes.
CREATE INDEX idx_customers_email ON customers(email);
SELECT * FROM customers WHERE email = 'claire.martin@email.com';

CREATE INDEX idx_customers_phone_number ON customers(phone_number);
SELECT * FROM customers WHERE phone_number = '0678451236';

CREATE INDEX idx_account_last_name ON customers(last_name);
SELECT * FROM customers WHERE last_name = 'Martin';


-- EXPLAIN ANALYZE
-- Utiliser cet outil pour analyser le plan d'exécution des requêtes 
-- avant et après indexation

EXPLAIN SELECT * 
FROM customers 
WHERE email = 'claire.martin@email.com';

EXPLAIN
SELECT * 
FROM customers 
WHERE phone_number = '0678451236';

EXPLAIN
SELECT * 
FROM customers 
WHERE last_name = 'Martin';

-- Comparer les Performances
-- Démontrer l'impact des index sur la rapidité d'exécution des 
-- requêtes

-- Nous n'avons pas assez de donner pour comparer les differences avant et après l'index mais l'index permet d'accéder plus rapidement au données en pointant directement sur la ligne demandé.
-- Sans index, pour trouver une donnée, la base de données doit scanner toutes les lignes (full table scan).

-- Justifier les Choix
-- Expliquer pourquoi chaque index a été créé et sur quelles 
-- colonnes.

CREATE INDEX idx_customers_email ON customers(email);
SELECT * FROM customers WHERE email = 'claire.martin@email.com';

CREATE INDEX idx_customers_phone_number ON customers(phone_number);
SELECT * FROM customers WHERE phone_number = '0678451236';

CREATE INDEX idx_account_last_name ON customers(last_name);
SELECT * FROM customers WHERE last_name = 'Martin';

-- Car lors de la recherche d’un client, l’adresse e-mail, le numéro de téléphone ou le nom sont souvent demandés afin de pouvoir retrouver un compte.
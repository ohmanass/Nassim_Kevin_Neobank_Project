INSERT INTO customers (last_name, name, email, phone_number, birth_date, status)
VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', '0612345678', '1985-04-12', 'actif'),
('Martin', 'Claire', 'claire.martin@email.com', '0678451236', '1990-09-22', 'actif'),
('Bernard', 'Lucas', 'lucas.bernard@email.com', '0654789123', '1978-01-30', 'suspendu');

INSERT INTO accounts (account_number, customer_id, account_type, balance, currency, status)
VALUES
('FR7612345678901234567890123', 1, 'current', 5000.00, 'EUR', 'active'),
('FR7612345678901234567890456', 1, 'epargne', 12000.00, 'EUR', 'active'),
('FR7612345678901234567890789', 2, 'current', 3000.00, 'EUR', 'active'),
('FR7612345678901234567890999', 3, 'current', 1500.00, 'EUR', 'blocked');

INSERT INTO transaction_types (wording, description)
VALUES
('transfer', 'Bank transfer'),
('withdrawal', 'ATM withdrawal'),
('deposit', 'Cash deposit'),
('card_payment', 'Payment by credit card');

INSERT INTO transactions 
(source_account_id, destination_account_id, transaction_type_id, amount, status, reference_externe)
VALUES
(1, 3, 1, 500.00, 'successful', 'REF001'),
(3, 1, 1, 200.00, 'successful', 'REF002'),
(1, 1, 2, 100.00, 'successful', 'ATM001'),
(2, 1, 3, 1000.00, 'pending', 'DEP001'),
(3, 4, 1, 250.00, 'declined', 'REF003');

INSERT INTO credit_cards 
(number_card, account_id, card_type, expiration_date, payment_ceiling, withdrawal_limit, status)
VALUES
('1234567812345678', 1, 'VISA', '2027-12-31', 3000.00, 1000.00, 'active'),
('8765432187654321', 3, 'MASTERCARD', '2026-06-30', 2000.00, 800.00, 'active');

INSERT INTO credit_card_payment (transaction_id, credit_card_id)
VALUES
(1, 1),
(2, 2);

INSERT INTO wire_bank (reference, pattern, transaction_id)
VALUES
('WIRE001', 'SEPA', 1),
('WIRE002', 'SEPA', 2);

INSERT INTO beneficiary (name, iban, bank, customer_id)
VALUES
('Société ABC', 'FR7630006000011234567890189', 'BNP Paribas', 1),
('Entreprise XYZ', 'FR7630006000019876543210456', 'Société Générale', 2);

INSERT INTO fraud_alerts (risk_score, status, transaction_id)
VALUES
(85, 'open', 5),
(40, 'closed', 1);

INSERT INTO transaction_limits (daily_limit, monthly_limit, account_id)
VALUES
(2000.00, 10000.00, 1),
(1500.00, 8000.00, 3);

INSERT INTO audit_logs (table_concerned, recording_id, operation_type, users, old_value, new_value)
VALUES
('accounts', 1, 'UPDATE', 'admin', 'balance: 4500', 'balance: 5000'),
('transactions', 5, 'INSERT', 'system', 'NULL', 'transaction created');

INSERT INTO session_login (ip_address, device, customer_id)
VALUES
('192.168.1.10', 'Chrome - Windows', 1),
('192.168.1.15', 'Safari - iPhone', 2);


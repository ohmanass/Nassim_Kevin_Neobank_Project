DROP TABLE IF EXISTS session_login;
DROP TABLE IF EXISTS audit_logs;
DROP TABLE IF EXISTS transaction_limits;
DROP TABLE IF EXISTS fraud_alerts;
DROP TABLE IF EXISTS beneficiary;
DROP TABLE IF EXISTS wire_bank;
DROP TABLE IF EXISTS credit_card_payment;
DROP TABLE IF EXISTS credit_cards;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS transaction_types;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    birth_date DATE,
    subscription_data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT chk_status_customer
        CHECK (status IN ('actif', 'suspendu', 'ferme'))
);

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(34) NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    status VARCHAR(20) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_balance_positiv
        CHECK (balance >= 0),
    CONSTRAINT chk_account_type
        CHECK (account_type IN ('current', 'epargne')),
    CONSTRAINT chk_status_account
        CHECK (status IN ('active', 'blocked', 'close'))
);

CREATE TABLE transaction_types (
    transaction_type_id INT AUTO_INCREMENT PRIMARY KEY,
    wording VARCHAR(20) NOT NULL,
    CONSTRAINT chk_wording_tt
        CHECK (wording IN ('transfer','withdrawal','deposit','card_payment')),
    description VARCHAR(255)
 );

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    source_account_id INT NOT NULL,
    CONSTRAINT fk_source_account
        FOREIGN KEY (source_account_id)
        REFERENCES accounts(account_id),
    destination_account_id INT NOT NULL,
    CONSTRAINT fk_destination_account
        FOREIGN KEY (destination_account_id)
        REFERENCES accounts(account_id),
    transaction_type_id INT NOT NULL,
    CONSTRAINT fk_transaction_type
        FOREIGN KEY (transaction_type_id)
        REFERENCES transaction_types(transaction_type_id),
    amount DECIMAL(15,2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT chk_status_transaction
        CHECK (status IN ('successful', 'declined', 'pending')),
    reference_externe VARCHAR(50)
);

CREATE TABLE credit_cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    number_card VARCHAR(16) NOT NULL,
    account_id INT NOT NULL,
    CONSTRAINT fk_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id),
    card_type VARCHAR(20) NOT NULL,
    expiration_date DATE NOT NULL,
    payment_ceiling DECIMAL(15,2),
    withdrawal_limit DECIMAL(15,2),
    status VARCHAR(20)
);

CREATE TABLE credit_card_payment (
    credit_card_payment_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    CONSTRAINT fk_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES transactions(transaction_id),
    credit_card_id INT NOT NULL,
    CONSTRAINT fk_credit_card
        FOREIGN KEY (credit_card_id) 
        REFERENCES credit_cards(card_id)
);

CREATE TABLE wire_bank (
    wire_bank_id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    reference VARCHAR(255) NOT NULL,
    pattern VARCHAR(255) NOT Null,
    execution_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    transaction_id INT NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

CREATE TABLE beneficiary (
    beneficiary_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    iban VARCHAR(34) NOT NULL, 
    bank VARCHAR(255) NOT NULL, 
    date_added TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE fraud_alerts (
    fraud_alerts_id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    risk_score INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT chk_status_fraud_alerts
        CHECK (status IN ('open','closed','under_review')),
    detection_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    transaction_id INT NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

CREATE TABLE transaction_limits (
    transaction_limits_id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    daily_limit DECIMAL(15, 2) NOT NULL,
    monthly_limit DECIMAL(15, 2) NOT NULL,
    update_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    account_id INT NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    table_concerned VARCHAR(255) NOT NULL,
    recording_id INT NOT NULL,
    operation_type VARCHAR(10) NOT NULL,
    CONSTRAINT chk_operation_type
        CHECK (operation_type IN ('INSERT','UPDATE','DELETE')),
    users VARCHAR(255) NOT NULL,
    date_operation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    old_value TEXT NOT NULL,
    new_value TEXT NOT NULL
);

CREATE TABLE session_login (
    session_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    login_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(255) NOT NULL,
    device VARCHAR(255) NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
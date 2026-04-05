-- ==========================================
-- Project: High-Performance Relational Ledger
-- Architecture: Normalized SQL with ACID constraints
-- Target: SQLite / PostgreSQL Compatibility
-- ==========================================

-- 1. Entity: Users (Strict unique constraints)
CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Entity: Accounts (Financial Integrity)
CREATE TABLE IF NOT EXISTS accounts (
    account_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    currency TEXT DEFAULT 'USD',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 3. Entity: Transactions (The Core Ledger)
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id TEXT PRIMARY KEY, -- GUID/UUID for global sync
    account_id INTEGER NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    type TEXT CHECK(type IN ('CREDIT', 'DEBIT')),
    status TEXT DEFAULT 'PENDING',
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- 4. PERFORMANCE: Indexes for high-speed lookups
-- Crucial for portfolios: shows you care about speed!
CREATE INDEX idx_transaction_timestamp ON transactions(timestamp);
CREATE INDEX idx_user_email ON users(email);

-- 5. ANALYTICS: A "Virtual View" for the Dashboard
-- This shows you can simplify complex data for a Frontend
CREATE VIEW IF NOT EXISTS dashboard_summary AS
    SELECT 
        u.username, 
        a.balance, 
        t.amount, 
        t.type, 
        t.timestamp
    FROM users u
    JOIN accounts a ON u.user_id = a.user_id
    JOIN transactions t ON a.account_id = t.account_id
    ORDER BY t.timestamp DESC;

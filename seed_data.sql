-- ==========================================
-- Project: Sample Data for Relational Ledger
-- Purpose: Functional validation of Schema
-- ==========================================

-- 1. Insert Initial Users
INSERT INTO users (username, email) VALUES 
('dougfret_dev', 'doug@aibizstack.com'),
('test_client', 'client@example.com');

-- 2. Initialize Accounts
INSERT INTO accounts (user_id, balance, currency) VALUES 
(1, 5000.00, 'USD'),
(2, 1200.50, 'USD');

-- 3. Execute Initial Transactions (The Ledger)
-- ID format: UUID/GUID simulation for Global Sync
INSERT INTO transactions (transaction_id, account_id, amount, type, status) VALUES 
('TX-99001', 1, 150.00, 'DEBIT', 'COMPLETED'),
('TX-99002', 1, 200.00, 'CREDIT', 'COMPLETED'),
('TX-99003', 2, 50.25, 'DEBIT', 'PENDING');

-- 4. TEST THE VIEW (The Senior Move)
-- After running this, the 'dashboard_summary' view will automatically populate.
SELECT * FROM dashboard_summary;

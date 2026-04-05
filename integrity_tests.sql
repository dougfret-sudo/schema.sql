-- ==========================================
-- Project: Database Integrity & Audit Tests
-- Purpose: Validation of Business Logic & Constraints
-- ==========================================

-- TEST 1: Constraint Enforcement (The "Invalid Type" Test)
-- This SHOULD FAIL if the schema is professional. 
-- It proves your CHECK constraints work.
INSERT INTO transactions (transaction_id, account_id, amount, type) 
VALUES ('FAIL-001', 1, 100.00, 'INVALID_TYPE');

-- TEST 2: Orphaned Data Prevention
-- Attempting to delete a user should trigger the CASCADE to accounts.
-- Proves you understand Referential Integrity.
DELETE FROM users WHERE user_id = 2;
SELECT * FROM accounts WHERE user_id = 2; -- Should return 0 rows.

-- TEST 3: Atomic Snapshot
-- Proves the "Dashboard View" handles joins even with missing transaction data.
SELECT username, balance FROM dashboard_summary WHERE username = 'dougfret_dev';

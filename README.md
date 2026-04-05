# High-Performance Relational Ledger Schema 🗄️

A pure SQL implementation of a **Normalized Transactional Ledger**. Designed for high-integrity financial systems, this schema focuses on **ACID compliance**, data validation, and query performance.

## 🏛️ Architectural Features

*   **Data Normalization:** Separation of concerns between `users`, `accounts`, and `transactions` to ensure zero data redundancy.
*   **Referential Integrity:** Utilizes `FOREIGN KEY` constraints with `ON DELETE CASCADE` to maintain a clean audit trail.
*   **Performance Indexing:** Strategic B-Tree indexes on `timestamp` and `email` columns for O(log n) lookup speeds.
*   **Business Logic Layer:** Implements a **SQL View** (`dashboard_summary`) to abstract complex joins from the application layer.

## 📁 File Structure
- `schema.sql`: The core DDL (Data Definition Language) script.
- `seed_data.sql`: Functional test data to verify constraints and view logic.

## 🛠️ Sandbox Verified
This schema was validated in a **hardware-isolated environment** (iMac Sandbox) using **SQLite** to ensure 100% stability and constraint enforcement.

## 🚦 How to Test
1. Open any SQL client (SQLite Studio, DBeaver, or terminal).
2. Run `schema.sql` to build the architecture.
3. Run `seed_data.sql` to verify the logic.

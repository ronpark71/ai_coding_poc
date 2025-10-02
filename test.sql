```sql
SELECT 
    t.transaction_date,
    SUM(t.amount) AS total_amount,
    COUNT(t.transaction_id) AS transaction_count,

    -- Deposits
    SUM(CASE WHEN t.txn_type_id = 1001 THEN t.amount ELSE 0 END) AS deposit_amount,
    COUNT(CASE WHEN t.txn_type_id = 1001 THEN 1 END) AS deposit_count,

    -- Withdrawals
    SUM(CASE WHEN t.txn_type_id = 2001 THEN t.amount ELSE 0 END) AS withdrawal_amount,
    COUNT(CASE WHEN t.txn_type_id = 2001 THEN 1 END) AS withdrawal_count,

    -- Fees
    SUM(CASE WHEN t.txn_type_id = 3001 THEN t.amount ELSE 0 END) AS fees_amount,
    COUNT(CASE WHEN t.txn_type_id = 3001 THEN 1 END) AS fees_count,

    -- Interest
    SUM(CASE WHEN t.txn_type_id = 4001 THEN t.amount ELSE 0 END) AS interest_amount,
    COUNT(CASE WHEN t.txn_type_id = 4001 THEN 1 END) AS interest_count

FROM 
    fct_transactions t
JOIN 
    dim_account a ON t.account_id = a.account_id
GROUP BY 
    t.transaction_date;
```
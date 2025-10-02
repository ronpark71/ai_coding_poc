```sql
SELECT 
    t.transaction_date,
    SUM(t.amount) AS total_amount,
    COUNT(t.transaction_id) AS transaction_count,

    -- Deposits
    SUM(CASE WHEN t.txn_type_id = 10011 THEN t.amount ELSE 0 END) AS deposit_amount,
    COUNT(CASE WHEN t.txn_type_id = 10011 THEN 1 END) AS deposit_count,

    -- Withdrawals
    SUM(CASE WHEN t.txn_type_id = 20011 THEN t.amount ELSE 0 END) AS withdrawal_amount,
    COUNT(CASE WHEN t.txn_type_id = 20011 THEN 1 END) AS withdrawal_count,

    -- Fees
    SUM(CASE WHEN t.txn_type_id = 30011 THEN t.amount ELSE 0 END) AS fees_amount,
    COUNT(CASE WHEN t.txn_type_id = 30011 THEN 1 END) AS fees_count,

    -- Interest
    SUM(CASE WHEN t.txn_type_id = 40011 THEN t.amount ELSE 0 END) AS interest_amount,
    COUNT(CASE WHEN t.txn_type_id = 40011 THEN 1 END) AS interest_count,

    -- Test1: txn_type_id = 50011
    SUM(CASE WHEN t.txn_type_id = 50011 THEN t.amount ELSE 0 END) AS test1_amount,
    COUNT(CASE WHEN t.txn_type_id = 50011 THEN 1 END) AS test1_count,

    -- Test2: txn_type_id = 60011
    SUM(CASE WHEN t.txn_type_id = 60011 THEN t.amount ELSE 0 END) AS test2_amount,
    COUNT(CASE WHEN t.txn_type_id = 60011 THEN 1 END) AS test2_count,

    -- Test3: txn_type_id = 70011
    SUM(CASE WHEN t.txn_type_id = 70011 THEN t.amount ELSE 0 END) AS test3_amount,
    COUNT(CASE WHEN t.txn_type_id = 70011 THEN 1 END) AS test3_count,

    -- Test4: txn_type_id = 80011
    SUM(CASE WHEN t.txn_type_id = 80011 THEN t.amount ELSE 0 END) AS test4_amount,
    COUNT(CASE WHEN t.txn_type_id = 80011 THEN 1 END) AS test4_count

FROM 
    fct_transactions t
JOIN 
    dim_account a ON t.account_id = a.account_id

-- Added LEFT JOIN to dim_payment_identifier using pymt_id column
LEFT JOIN 
    dim_payment_identifier pi ON t.pymt_id = pi.pymt_id

GROUP BY 
    t.transaction_date;
```
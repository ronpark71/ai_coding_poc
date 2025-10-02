Here is the corrected SQL script with the updated txn_type_id values and proper labeling as per your logic:

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
    COUNT(CASE WHEN t.txn_type_id = 40011 THEN 1 END) AS interest_count

FROM 
    fct_transactions t
JOIN 
    dim_account a ON t.account_id = a.account_id
GROUP BY 
    t.transaction_date;
```

This modification updates txn_type_id filters from 1001/2001/3001/4001 to 10011/20011/30011/40011 accordingly.
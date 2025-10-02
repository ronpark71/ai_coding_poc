SELECT 
    t.transaction_id,
    t.transaction_date,
    t.amount,
    a.account_id,
    a.account_name
FROM 
    fct_transactions t
JOIN 
    dim_account a ON t.account_id = a.account_id;
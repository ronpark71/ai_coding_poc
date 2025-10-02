SELECT 
    t.transaction_date,
    sum( t.amount) as total_amount,
    count( t.transaction_id)    as transaction_count
FROM 
    fct_transactions t
JOIN 
    dim_account a ON t.account_id = a.account_id
GROUP BY 1;
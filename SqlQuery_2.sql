-- 1 All accounts from customer with id = 1

SELECT * 
FROM Konton 
WHERE kunder_id = 1;

-- 2 All balance from customer with id = 1

SELECT SUM(saldo) AS total_balance 
FROM Konton 
WHERE kunder_id = 1;

-- 3. View all transactions for a specific account with id = 5

SELECT * 
FROM Transaktioner 
WHERE from_konton_id = 1 OR to_konton_id = 5;

-- 4 Find the three accounts with the highest balance

SELECT * 
FROM Konton 
ORDER BY saldo DESC 
LIMIT 3;

-- 5 Calculate the total amount of deposits and withdrawals for account with id = 10

SELECT 
    SUM(CASE WHEN to_konton_id = 10 THEN amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN from_konton_id = 10 THEN amount ELSE 0 END) AS total_withdrawals
FROM Transaktioner
WHERE from_konton_id = 10 OR to_konton_id = 10;

-- 6. Find all transactions made in the last 30 Days

SELECT * 
FROM Transaktioner 
WHERE date >= CURDATE() - INTERVAL 30 DAY;


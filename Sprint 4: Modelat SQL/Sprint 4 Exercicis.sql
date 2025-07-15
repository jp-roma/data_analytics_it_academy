#Nivell 1 -- Exercici 1
SELECT CONCAT(users.name, " ", users.surname) AS user_name, plus_t.total_transactions
FROM users
JOIN
(
SELECT user_id, COUNT(id) AS total_transactions
FROM transactions
GROUP BY user_id
HAVING COUNT(id) >80
) as plus_t
ON users.id = plus_t.user_id;

#########
SELECT users.id, users.name, users.surname, COUNT(transactions.id) AS total_transactions
FROM users
JOIN transactions
ON users.id = transactions.user_id
GROUP BY users.id, users.name, users.surname
HAVING COUNT(transactions.id) > 80;

#Exercici 2----

SELECT ROUND(AVG(t.amount),2) AS media_amount, cc.iban
FROM transactions t
JOIN credit_cards cc
ON t.card_id = cc.id
WHERE t.business_id IN
(
SELECT company_id
FROM companies
WHERE company_name = 'Donec Ltd'
)
GROUP BY cc.iban
ORDER BY media_amount DESC;

#########

SELECT ROUND(AVG(t.amount),2) AS media_amount, cc.iban
FROM transactions t
JOIN companies c
ON t.business_id = c.company_id
JOIN credit_cards cc
ON cc.id = t.card_id
WHERE c.company_name = 'Donec Ltd'
GROUP BY cc.iban
ORDER BY media_amount DESC;

######

#Nivell 2 - Exercici 1 -------
CREATE TEMPORARY TABLE IF NOT EXISTS cc_last_t AS 
(
WITH cc_activity_t AS
(
SELECT transactions.card_id, transactions.timestamp, transactions.declined,
ROW_NUMBER() OVER (PARTITION BY card_id ORDER BY timestamp DESC) AS num_transaction
FROM transactions
)
SELECT card_id,
	CASE
		WHEN SUM(declined) <=2 THEN 'Activa'
        ELSE 'Inactiva'
	END AS cc_state
FROM cc_activity_t
WHERE num_transaction <=3
GROUP BY card_id
);

SELECT * FROM cc_last_t
WHERE cc_state = 'Activa';

#Nivell 3 - Exercici 1 -----

SELECT transactions.id AS transaction_id, transactions.products_id, products.id AS unique_product_id
        FROM transactions
        JOIN products
        ON   FIND_IN_SET((products.id),
        REPLACE(transactions.products_id, ' ', '')) > 0;
        
####
        
CREATE TABLE IF NOT EXISTS transactions_products AS (
SELECT transactions.id AS transaction_id, transactions.products_id, products.id AS unique_product_id
        FROM transactions
        JOIN products
        ON   FIND_IN_SET((products.id),
        REPLACE(transactions.products_id, ' ', '')) > 0
        );

####

SELECT unique_product_id, COUNT(transaction_id) AS salesxp
FROM transactions_products
GROUP BY unique_product_id;
        
        
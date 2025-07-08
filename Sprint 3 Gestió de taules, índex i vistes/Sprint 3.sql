-- Nivel 1 / Exercici 1 --
CREATE TABLE IF NOT EXISTS credit_card (
id VARCHAR (20),
iban VARCHAR (50) NOT NULL,
pan VARCHAR (50) NOT NULL,
pin INT NOT NULL,
cvv INT NOT NULL, 
expiring_date VARCHAR (255) NOT NULL,
PRIMARY KEY (id));

#INSERT INTO credit_card () 
-- VALUES () -- se ejecutan los datos para cargar la información proporcionada relativa a la tabla 'credit_card'

ALTER TABLE transaction
ADD CONSTRAINT FK_TransactionCreditCard
FOREIGN KEY (credit_card_id) REFERENCES credit_card(id); -- Se define una restricción de FK en la tabla hijo (transaction) 

#Exercici 2 ---
SELECT *
FROM credit_card
WHERE id = 'CcU-2938';

UPDATE credit_card
SET iban = 'TR323456312213576817699999'
WHERE id = 'CcU-2938';

SELECT *
FROM credit_card
WHERE id = 'CcU-2938';

#Exercici 3--
INSERT INTO transaction
(id, credit_card_id, company_id, user_id, lat, longitude, amount, declined)
VALUES 
('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999','b-9999', '9999','829.999', '-117.999', '111.11', '0');

# Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
-- (`transactions`.`transaction`, CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`))
# Debido a la restricción de la clave foránea, el o los valores a insertar en la tabla hijo, 
-- deben existir en la tabla padre, o la inserción fallará.
# Para solucionar esto, se debería solicitar la información correspondiente, para completar los datos en las tablas "credit_card" y "company"
-- para luego poder realizar la carga de los valores en la tabla "transaction".


#Excercici 4 ---

ALTER TABLE credit_card
DROP COLUMN pan;

SHOW COLUMNS FROM credit_card;

#Nivell 2 - Exercici 1 ---
SELECT * FROM transaction
WHERE id = '000447FE-B650-4DCF-85DE-C7ED0EE1CAAD';

DELETE FROM transaction
WHERE id = '000447FE-B650-4DCF-85DE-C7ED0EE1CAAD';

SELECT * FROM transaction
WHERE id = '000447FE-B650-4DCF-85DE-C7ED0EE1CAAD';

#Exercici 2
CREATE VIEW VistaMarketing AS
SELECT company_name, phone, country, round(avg(amount)) as media_buy_companies
FROM company c
JOIN transaction t
ON c.id = t.company_id
GROUP BY c.company_name, c.phone, c.country
ORDER BY media_buy_companies DESC;

#Exercici 3 
SELECT * FROM VistaMarketing
WHERE country = 'Germany';

#Nivell 3 - Exercici 1 ---
CREATE TABLE IF NOT EXISTS user (
	id INT NOT NULL PRIMARY KEY, -- se cambia el tipo de dato a un INT, para que concuerde con el expresado en el DIAGRAMA--
	name VARCHAR(100),
	surname VARCHAR(100),
	phone VARCHAR(150),
	email VARCHAR(150),
	birth_date VARCHAR(100),
	country VARCHAR(150),
	city VARCHAR(150),
	postal_code VARCHAR(100),
	address VARCHAR(255)    
    );
    
#INSERT INTO user () 
#VALUES (   ) -- se ejecutan los datos para cargar la información proporcionada, relativa a la tabla 'user'

ALTER TABLE transaction
ADD CONSTRAINT FKTransactionUser
FOREIGN KEY (user_id) REFERENCES user(id); -- Se define una restricción de FK en la tabla hijo (transaction)

#MODIFICAR TABLA credit_card, insertamos nueva columna fecha_actual DATE
ALTER TABLE credit_card
ADD COLUMN fecha_actual DATE;

#MODIFICAR TABLA company, eliminar columna website
ALTER TABLE company
DROP COLUMN website;

#Exercici 2 --

#CREATE VIEW InformeTecnico AS
SELECT t.id AS id_transaccion, u.name as nombre_usuario, u.surname as apellido_usuario, 
cc.iban as iban_tarjeta_usada, c.company_name as nombre_compania_transaccion
FROM transaction t
JOIN user u
ON t.user_id = u.id
JOIN company c
ON t.company_id = c.id
JOIN credit_card cc
ON t.credit_card_id = cc.id
ORDER BY id_transaccion DESC;

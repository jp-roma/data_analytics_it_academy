CREATE DATABASE top_toys_inc; -- Creamos una nueva base de datos para alojar la información de las diferentes tablas

#######  -- Creamos la tabla products, teniendo en cuenta los campos y tipos de datos a cargar
CREATE TABLE products ( 
id CHAR (50) PRIMARY KEY,
product_name VARCHAR (255),
price  VARCHAR (30),
colour VARCHAR (150),
weight FLOAT,
warehouse_id VARCHAR (100));


######## -- Creamos la tabla companies, teniendo en cuenta los campos y tipos de datos a cargar
CREATE TABLE companies (
company_id VARCHAR (20) PRIMARY KEY,
company_name VARCHAR (255),
phone VARCHAR (15),
email VARCHAR (100),
country VARCHAR (100),
website VARCHAR (255)
);

####### -- Creamos la tabla credit_cards, teniendo en cuenta los campos y tipos de datos a cargar
CREATE TABLE credit_cards ( 
id VARCHAR (15) PRIMARY KEY,
user_id INT,
iban VARCHAR (50),
pan VARCHAR (150),
pin INT,
cvv INT,
track1 VARCHAR (255),
track2 VARCHAR (255),
expiring_date VARCHAR (255)
);

######### -- Creamos la tabla users, para luego unificar los datos de european_users y american_users, 
-- teniendo en cuenta los campos y tipos de datos a cargar
CREATE TABLE users (
id INT PRIMARY KEY,
name VARCHAR (100),
surname VARCHAR (100),
phone VARCHAR (150),
email VARCHAR (150),
birth_date VARCHAR (100),
country VARCHAR (150),
city VARCHAR (150),
postal_code VARCHAR (100),
address VARCHAR (255)
);


######### -- Creamos la tabla transactions, teniendo en cuenta los campos y tipos de datos a cargar, 
-- con sus respectivas FK y asi crear un modelo estrella

CREATE TABLE transactions (
id VARCHAR (255) PRIMARY KEY,
card_id VARCHAR (15),
business_id VARCHAR (50),
timestamp TIMESTAMP,
amount DECIMAL (10,2),
declined TINYINT,
products_id CHAR (50),
user_id INT,
lat FLOAT,
longitude FLOAT,
FOREIGN KEY (card_id) REFERENCES credit_cards (id),
FOREIGN KEY (business_id) REFERENCES companies (company_id),
FOREIGN KEY (user_id) REFERENCES users (id),
FOREIGN KEY (products_id) REFERENCES products (id) ON UPDATE CASCADE
);

##########CARGAR DATOS TABLA PRODUCTS
# La sentencia LOAD DATA INFILE requiere que se especifique el archivo fuente y la tabla de destino
-- los parámetros añadidos especifican que los campos están separados por comas, 
-- que las cadenas están encerradas por comillas dobles 
-- y que la primera fila debe ser ignorada porque contiene cabeceras de columna.

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv' -- usar forward slash
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; 

######## CARGAR DATOS TABLA COMPANIES

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/companies.csv' -- usar forward slash
INTO TABLE companies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

######## CARGAR DATOS TABLA CREDIT_CARDS

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_cards.csv' -- usar forward slash
INTO TABLE credit_cards
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

############## 

SHOW VARIABLES LIKE 'lc_time_names'; -- # Variable_name, Value 'lc_time_names', 'en_US'

SET lc_time_names = 'es_ES'; -- se cambia la configuración a regional ES

########### CARGAR DATOS TABLA USERS
LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/american_users.csv' -- usar forward slash
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

######### CARGAR DATOS TABLA USERS
LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/european_users.csv' -- usar forward slash
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

########### CARGAR DATOS TABLA TRANSACTIONS

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/transactions.csv' -- usar forward slash
INTO TABLE transactions
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 USE DB_T05429_GUSTAVO_MARTINS_SANTOS;

CREATE TABLE PRODUCT (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(128) NOT NULL,
    CATEGORY VARCHAR (50),
    PRICE FLOAT,
    STOCK INT
    );
    
CREATE TABLE CUSTOMER (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(128) NOT NULL,
    AGE INT,
    CITY VARCHAR (130),
    EMAIL VARCHAR (250)
    );
    
    CREATE TABLE ORDER_TABLE (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR (128),
    PRODUCT_NAME VARCHAR (128),
    QUANTITY INT,
    TOTAL_VALUE FLOAT
    );
    
    
INSERT INTO PRODUCT (ID, NAME,CATEGORY, PRICE, STOCK) VALUES
(NULL, 'Maria-mole', 'Caseiro', 5.00,10),
(NULL, 'Pão de Mel', 'Caseiro', 4.50,15),   
(NULL, 'Paçoca', 'Caseiro', 1.50,30),
(NULL, 'Pé-de-Moleque', 'Caseiro', 3.20,35),
(NULL, 'Suspiro', 'Caseiro', 2.00, 40);

INSERT INTO PRODUCT VALUES
(NULL,'Pirulito', 'Industrial', 1.00,50),
(NULL,'Bala', 'Industrial', 0.25,100),
(NULL,'Chiclete', 'Industrial', 0.50,100),
(NULL,'Cone de doce de leite', 'Industrial', 2.75,25),
(NULL,'Bombom', 'Industrial', 2.15,11);

SELECT * FROM PRODUCT;
 
INSERT INTO CUSTOMER (NAME, AGE, CITY, EMAIL) VALUES
('Ana Silva', 28, 'São Paulo', 'ana.silva@email.com'),
('Bruno Oliveira', 34, 'Rio de Janeiro', 'bruno.oliveira@email.com'),
('Carla Santos', 22, 'Belo Horizonte', 'carla.santos@email.com'),
('Diego Costa', 41, 'Curitiba', 'diego.costa@email.com'),
('Eduarda Lima', 29, 'Porto Alegre', 'eduarda.lima@email.com');

INSERT INTO CUSTOMER VALUES
(NULL,'Felipe Souza', 31, 'Salvador', 'felipe.souza@email.com'),
(NULL,'Gabriela Rocha', 25, 'Recife', 'gabriela.rocha@email.com'),
(NULL,'Henrique Alves', 37, 'Fortaleza', 'henrique.alves@email.com'),
(NULL,'Isabela Martins', 26, 'Brasília', 'isabela.martins@email.com'),
(NULL,'João Pereira', 33, 'Florianópolis', 'joao.pereira@email.com'); //
 
 SELECT * FROM CUSTOMER;

INSERT INTO ORDER_TABLE (CUSTOMER_NAME, PRODUCT_NAME, QUANTITY, TOTAL_VALUE) VALUES
('Ana Silva', 'Maria-mole', 10, 50.00),
('Bruno Oliveira', 'Pão de Mel', 5, 22.50),
('Carla Santos', 'Paçoca', 20, 30.00),
('Diego Costa', 'Pé-de-Moleque', 8, 25.60),
('Eduarda Lima', 'Suspiro', 15, 30.00);

INSERT INTO ORDER_TABLE VALUES
(NULL,'Felipe Souza', 'Pirulito', 30, 30.00),
(NULL,'Gabriela Rocha', 'Bala', 50, 12.50),
(NULL,'Henrique Alves', 'Chiclete', 40, 20.00),
(NULL,'Isabela Martins', 'Cone de doce de leite', 6, 16.50),
(NULL,'João Pereira', 'Bombom', 12, 25.80);


SELECT * FROM ORDER_TABLE;
 
SELECT NAME, PRICE 
FROM PRODUCT 
WHERE PRICE>2.00;

SELECT NAME, AGE 
FROM CUSTOMER 
WHERE AGE>18;

SELECT PRODUCT_NAME, QUANTITY 
FROM ORDER_TABLE 
WHERE QUANTITY>2;

SELECT * FROM PRODUCT 
LIMIT 5;

SELECT * FROM CUSTOMER
LIMIT 5;

SELECT * FROM CUSTOMER 
WHERE NAME LIKE 'ANA%';

SELECT * FROM CUSTOMER 
WHERE NAME LIKE '%Martins';

SELECT * FROM PRODUCT 
WHERE NAME LIKE '%de%';

SELECT * FROM PRODUCT 
WHERE NAME LIKE '___piro';
    
    
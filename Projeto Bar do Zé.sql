USE DB_T05429_GUSTAVO_MARTINS_SANTOS; 
 
 # Criação de Tabelas
 
 CREATE TABLE INVOICING ( 
 ID INT PRIMARY KEY AUTO_INCREMENT,  
 DATE DATE,  
 VALOR FLOAT,  
 TYPE VARCHAR (30),   
 DESCRIPTION VARCHAR (50)
); 

CREATE TABLE PRODUCT ( 
 ID INT PRIMARY KEY AUTO_INCREMENT,  
 NAME VARCHAR (100),  
 PRICE FLOAT,  
 STOCK INT 
); 

CREATE TABLE EMPLOYEE ( 
 ID INT PRIMARY KEY AUTO_INCREMENT,  
 NAME VARCHAR (128),  
 EXPERIENCE VARCHAR (30),   
 SALARY FLOAT,  
 ADMISSION YEAR  
); 

CREATE TABLE SUPPLIER 
( 
 ID INT PRIMARY KEY AUTO_INCREMENT,  
 NAME VARCHAR (128),  
 PRODUCT VARCHAR (100),  
 PHONE_NUMBER VARCHAR (20),  
 EMAIL VARCHAR (180),  
 PRICE FLOAT  
); 

CREATE TABLE TRANSACTION ( 
 ID INT PRIMARY KEY AUTO_INCREMENT,  
 DATE DATE,  
 PRODUCT VARCHAR (100),  
 QUANTITY INT,  
 PRICE FLOAT,  
 UNIT_COST FLOAT,  
 SUPPLIER VARCHAR (128),  
 EMPLOYEE VARCHAR (128),  
 CUSTOMER VARCHAR (128),  
 STATUS VARCHAR (40),  
 PROFIT FLOAT  
); 

CREATE TABLE CUSTOMER ( 
 ID INT PRIMARY KEY AUTO_INCREMENT,    
 NAME VARCHAR (128),  
 PHONE_NUMBER VARCHAR (20),  
 EMAIL VARCHAR(180)  
); 

-- Tabelas relacionais organizam dados em entidades separadas e conectam essas informações por meio de chaves (PRIMARY KEY e FOREIGN KEY)

CREATE TABLE EXECUTE ( 
 PRODUCT_ID INT PRIMARY KEY,  
 TRANSACTION_ID INT 
);

CREATE TABLE DISTRIBUTE 
( 
 SUPPLIER_ID INT PRIMARY KEY,  
 PRODUCT_ID INT
); 

-- Adição de chaves estrangeiras

ALTER TABLE INVOICING
ADD IDTRANSACTION INT;

ALTER TABLE EMPLOYEE
ADD IDTRANSACTION INT;

ALTER TABLE CUSTOMER
ADD IDTRANSACTION INT;

ALTER TABLE INVOICING ADD FOREIGN KEY(IDTRANSACTION) REFERENCES TRANSACTION (ID);
ALTER TABLE EMPLOYEE ADD FOREIGN KEY(IDTRANSACTION) REFERENCES TRANSACTION (ID);
ALTER TABLE CUSTOMER ADD FOREIGN KEY(IDTRANSACTION) REFERENCES TRANSACTION (ID);
ALTER TABLE EXECUTE ADD FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT (ID);
ALTER TABLE EXECUTE ADD FOREIGN KEY(TRANSACTION_ID) REFERENCES TRANSACTION (ID);
ALTER TABLE DISTRIBUTE ADD FOREIGN KEY(SUPPLIER_ID) REFERENCES SUPPLIER (ID);
ALTER TABLE DISTRIBUTE ADD FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT (ID);

# Inserção de dados

INSERT INTO PRODUCT VALUES
(NULL, 'CERVEJA', 10.00, 150),
(NULL, 'CACHAÇA', 3.00, 120),
(NULL, 'OVO ROSA', 2.50, 180),
(NULL, 'ESPETINHO', 8.00, 110),
(NULL, 'BOLINHO DE CARNE', 6.00, 140),
(NULL, 'COXINHA', 6.00, 160),
(NULL, 'RISOLES', 6.00, 130),
(NULL, 'QUIBE', 6.00, 125),
(NULL, 'EMPADA', 5.00, 135),
(NULL, 'TORRESMO', 5.00, 115),
(NULL, 'BATATA FRITA', 20.00, 105),
(NULL, 'AMENDOIM', 3.00, 200),
(NULL, 'OVO DE CODORNA', 1.00, 250),
(NULL, 'AZEITONA', 10.00, 145),
(NULL, 'QUEIJO COALHO', 7.00, 110),
(NULL, 'LINGUIÇA CALABRESA', 25.00, 102),
(NULL, 'PÃO COM MORTADELA', 8.00, 120),
(NULL, 'SARDINHA', 4.00, 175),
(NULL, 'CALDO DE MOCOTÓ', 12.00, 108),
(NULL, 'DOBRADINHA', 15.00, 104),
(NULL, 'CALDINHO DE FEIJÃO', 10.00, 130),
(NULL, 'REFRIGERANTE', 5.00, 190),
(NULL, 'ÁGUA TÔNICA', 6.00, 155),
(NULL, 'CIGARRO', 1.00, 220),
(NULL, 'ISQUEIRO', 6.00, 165),
(NULL, 'FÓSFORO', 1.00, 240),
(NULL, 'PAÇOCA', 1.50, 210),
(NULL, 'CHICLETE', 0.50, 300),
(NULL, 'CONHAQUE', 7.00, 112),
(NULL, 'CAFÉ', 2.00, 185);

SELECT * FROM PRODUCT;

INSERT INTO SUPPLIER VALUES
(NULL, 'Distribuidora Cevada Pura', 'Cerveja', '(11) 3456-7890', 'contato@cevadapura.com.br', 6.50),
(NULL, 'Alambique Velho Oeste', 'Cachaça', '(31) 3214-5678', 'vendas@alambiquevelhooeste.com.br', 1.20),
(NULL, 'Granja Renascer', 'Ovo rosa', '(19) 3876-5432', 'pedidos@granjarenascer.com.br', 1.10),
(NULL, 'Frigorífico Boi Gordo', 'Espetinho', '(16) 3345-6789', 'comercial@frigoboigordo.com.br', 3.80),
(NULL, 'Salgadaria Popular', 'Bolinho de carne', '(11) 2987-6543', 'atendimento@salgadariapopular.com.br', 2.50),
(NULL, 'Salgadaria Popular', 'Coxinha', '(11) 2987-6543', 'atendimento@salgadariapopular.com.br', 2.50),
(NULL, 'Salgadaria Popular', 'Risoles', '(11) 2987-6543', 'atendimento@salgadariapopular.com.br', 2.50),
(NULL, 'Salgadaria Popular', 'Quibe', '(11) 2987-6543', 'atendimento@salgadariapopular.com.br', 2.50),
(NULL, 'Salgadaria Popular', 'Empada', '(11) 2987-6543', 'atendimento@salgadariapopular.com.br', 2.10),
(NULL, 'Frigorífico Boi Gordo', 'Torresmo', '(16) 3345-6789', 'comercial@frigoboigordo.com.br', 1.80),
(NULL, 'Hortifruti do Campo', 'Batata frita', '(15) 3241-8900', 'sac@hortifrutidocampo.com.br', 8.50),
(NULL, 'Snacks do Cerrado', 'Amendoim', '(62) 3542-1122', 'contato@snacksdocerrado.com.br', 1.10),
(NULL, 'Granja Renascer', 'Ovo de codorna', '(19) 3876-5432', 'pedidos@granjarenascer.com.br', 0.40),
(NULL, 'Hortifruti do Campo', 'Azeitona', '(15) 3241-8900', 'sac@hortifrutidocampo.com.br', 4.20),
(NULL, 'Laticínios da Serra', 'Queijo coalho', '(35) 3654-3210', 'vendas@laticiniosdaserra.com.br', 3.40),
(NULL, 'Frigorífico Boi Gordo', 'Linguiça calabresa', '(16) 3345-6789', 'comercial@frigoboigordo.com.br', 11.00),
(NULL, 'Salgadaria Popular', 'Pão com mortadela', '(11) 2987-6543', 'atendimento@salgadariapopular.com.br', 3.20),
(NULL, 'Pescados da Costa', 'Sardinha', '(13) 3422-9988', 'comercial@pescadosdacosta.com.br', 1.70),
(NULL, 'Frigorífico Boi Gordo', 'Caldo de mocotó', '(16) 3345-6789', 'comercial@frigoboigordo.com.br', 5.50),
(NULL, 'Frigorífico Boi Gordo', 'Dobradinha', '(16) 3345-6789', 'comercial@frigoboigordo.com.br', 6.80),
(NULL, 'Hortifruti do Campo', 'Caldinho de feijão', '(15) 3241-8900', 'sac@hortifrutidocampo.com.br', 4.10),
(NULL, 'Distribuidora Cevada Pura', 'Refrigerante', '(11) 3456-7890', 'contato@cevadapura.com.br', 2.80),
(NULL, 'Distribuidora Cevada Pura', 'Água tônica', '(11) 3456-7890', 'contato@cevadapura.com.br', 3.10),
(NULL, 'Tabacaria Ouro Negro', 'Cigarro', '(21) 2567-4321', 'pedidos@tabacariaouronegro.com.br', 0.65),
(NULL, 'Tabacaria Ouro Negro', 'Isqueiro', '(21) 2567-4321', 'pedidos@tabacariaouronegro.com.br', 2.90),
(NULL, 'Tabacaria Ouro Negro', 'Fósforo', '(21) 2567-4321', 'pedidos@tabacariaouronegro.com.br', 0.45),
(NULL, 'Snacks do Cerrado', 'Paçoca', '(62) 3542-1122', 'contato@snacksdocerrado.com.br', 0.60),
(NULL, 'Snacks do Cerrado', 'Chiclete', '(62) 3542-1122', 'contato@snacksdocerrado.com.br', 0.15),
(NULL, 'Alambique Velho Oeste', 'Conhaque', '(31) 3214-5678', 'vendas@alambiquevelhooeste.com.br', 3.90),
(NULL, 'Hortifruti do Campo', 'Café', '(15) 3241-8900', 'sac@hortifrutidocampo.com.br', 0.80);

SELECT * FROM SUPPLIER;

# TRANSACTIONS possui vendas realizadas e pendentes (fiadas) diferenciadas pelo status

INSERT INTO TRANSACTION VALUES
(NULL, '2026-03-06', 'Azeitona', 6, 10.00, 4.20, 'Hortifruti do Campo', 'Ártemis Sister', 'Dona Maria', 'Realizada', 34.80),
(NULL, '2026-03-06', 'Queijo coalho', 10, 7.00, 3.40, 'Laticínios da Serra', 'Adônis Grega', 'Anônimo', 'Realizada', 36.00),
(NULL, '2026-03-06', 'Linguiça calabresa', 5, 25.00, 11.00, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Tião', 'Realizada', 70.00),
(NULL, '2026-03-07', 'Pão com mortadela', 18, 8.00, 3.20, 'Salgadaria Popular', 'Adônis Grega', 'Anônimo', 'Realizada', 86.40),
(NULL, '2026-03-07', 'Sardinha', 15, 4.00, 1.70, 'Pescados da Costa', 'Apolo God', 'João do Pulo', 'Realizada', 34.50),
(NULL, '2026-03-07', 'Caldo de mocotó', 10, 12.00, 5.50, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Anônimo', 'Realizada', 65.00),
(NULL, '2026-03-08', 'Dobradinha', 8, 15.00, 6.80, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Zé da Esquina', 'Realizada', 65.60),
(NULL, '2026-03-08', 'Caldinho de feijão', 15, 10.00, 4.10, 'Hortifruti do Campo', 'Ártemis Sister', 'Anônimo', 'Realizada', 88.50),
(NULL, '2026-03-08', 'Refrigerante', 30, 5.00, 2.80, 'Distribuidora Cevada Pura', 'Adônis Grega', 'Sr. Wilson', 'Realizada', 66.00),
(NULL, '2026-03-09', 'Água tônica', 15, 6.00, 3.10, 'Distribuidora Cevada Pura', 'Apolo God', 'Anônimo', 'Realizada', 43.50),
(NULL, '2026-03-09', 'Isqueiro', 5, 6.00, 2.90, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Roberto', 'Realizada', 15.50),
(NULL, '2026-03-09', 'Fósforo', 15, 1.00, 0.45, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Anônimo', 'Realizada', 8.25),
(NULL, '2026-03-10', 'Paçoca', 20, 1.50, 0.60, 'Snacks do Cerrado', 'Adônis Grega', 'Chico Mineiro', 'Realizada', 18.00),
(NULL, '2026-03-10', 'Chiclete', 80, 0.50, 0.15, 'Snacks do Cerrado', 'Apolo God', 'Anônimo', 'Realizada', 28.00),
(NULL, '2026-03-10', 'Conhaque', 12, 7.00, 3.90, 'Alambique Velho Oeste', 'Apolo God', 'Dona Maria', 'Realizada', 37.20),
(NULL, '2026-03-11', 'Cerveja', 45, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Anônimo', 'Realizada', 157.50),
(NULL, '2026-03-11', 'Coxinha', 28, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Tião', 'Realizada', 98.00),
(NULL, '2026-03-11', 'Cachaça', 55, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'Anônimo', 'Realizada', 99.00),
(NULL, '2026-03-12', 'Ovo rosa', 22, 2.50, 1.10, 'Granja Renascer', 'Apolo God', 'João do Pulo', 'Realizada', 30.80),
(NULL, '2026-03-12', 'Espetinho', 20, 8.00, 3.80, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Anônimo', 'Realizada', 84.00),
(NULL, '2026-03-12', 'Bolinho de carne', 15, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Zé da Esquina', 'Realizada', 52.50),
(NULL, '2026-03-13', 'Risoles', 12, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Anônimo', 'Realizada', 42.00),
(NULL, '2026-03-13', 'Quibe', 15, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Sr. Wilson', 'Realizada', 52.50),
(NULL, '2026-03-13', 'Empada', 18, 5.00, 2.10, 'Salgadaria Popular', 'Ártemis Sister', 'Anônimo', 'Realizada', 52.20),
(NULL, '2026-03-14', 'Torresmo', 30, 5.00, 1.80, 'Frigorífico Boi Gordo', 'Apolo God', 'Roberto', 'Realizada', 96.00),
(NULL, '2026-03-14', 'Batata frita', 10, 20.00, 8.50, 'Hortifruti do Campo', 'Ártemis Sister', 'Anônimo', 'Realizada', 115.00),
(NULL, '2026-03-14', 'Amendoim', 25, 3.00, 1.10, 'Snacks do Cerrado', 'Adônis Grega', 'Chico Mineiro', 'Realizada', 47.50),
(NULL, '2026-03-15', 'Ovo de codorna', 45, 1.00, 0.40, 'Granja Renascer', 'Apolo God', 'Anônimo', 'Realizada', 27.00),
(NULL, '2026-03-15', 'Azeitona', 12, 10.00, 4.20, 'Hortifruti do Campo', 'Ártemis Sister', 'Dona Maria', 'Realizada', 69.60),
(NULL, '2026-03-15', 'Queijo coalho', 15, 7.00, 3.40, 'Laticínios da Serra', 'Adônis Grega', 'Anônimo', 'Realizada', 54.00),
(NULL, '2026-03-16', 'Linguiça calabresa', 8, 25.00, 11.00, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Tião', 'Realizada', 112.00),
(NULL, '2026-03-16', 'Pão com mortadela', 20, 8.00, 3.20, 'Salgadaria Popular', 'Adônis Grega', 'Anônimo', 'Realizada', 96.00),
(NULL, '2026-03-16', 'Sardinha', 22, 4.00, 1.70, 'Pescados da Costa', 'Apolo God', 'João do Pulo', 'Realizada', 50.60),
(NULL, '2026-03-17', 'Caldo de mocotó', 15, 12.00, 5.50, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Anônimo', 'Realizada', 97.50),
(NULL, '2026-03-17', 'Dobradinha', 10, 15.00, 6.80, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Zé da Esquina', 'Realizada', 82.00),
(NULL, '2026-03-17', 'Caldinho de feijão', 20, 10.00, 4.10, 'Hortifruti do Campo', 'Ártemis Sister', 'Anônimo', 'Realizada', 118.00),
(NULL, '2026-03-18', 'Refrigerante', 35, 5.00, 2.80, 'Distribuidora Cevada Pura', 'Adônis Grega', 'Sr. Wilson', 'Realizada', 77.00),
(NULL, '2026-03-18', 'Água tônica', 18, 6.00, 3.10, 'Distribuidora Cevada Pura', 'Apolo God', 'Anônimo', 'Realizada', 52.20),
(NULL, '2026-03-18', 'Cigarro', 75, 1.00, 0.65, 'Tabacaria Ouro Negro', 'Apolo God', 'Roberto', 'Realizada', 26.25),
(NULL, '2026-03-19', 'Isqueiro', 8, 6.00, 2.90, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Anônimo', 'Realizada', 24.80),
(NULL, '2026-03-19', 'Fósforo', 20, 1.00, 0.45, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Chico Mineiro', 'Realizada', 11.00),
(NULL, '2026-03-19', 'Paçoca', 30, 1.50, 0.60, 'Snacks do Cerrado', 'Adônis Grega', 'Anônimo', 'Realizada', 27.00),
(NULL, '2026-03-20', 'Chiclete', 110, 0.50, 0.15, 'Snacks do Cerrado', 'Apolo God', 'Dona Maria', 'Realizada', 38.50),
(NULL, '2026-03-20', 'Conhaque', 15, 7.00, 3.90, 'Alambique Velho Oeste', 'Apolo God', 'Anônimo', 'Realizada', 46.50),
(NULL, '2026-03-20', 'Café', 40, 2.00, 0.80, 'Hortifruti do Campo', 'Apolo God', 'Tião', 'Realizada', 48.00),
(NULL, '2026-03-21', 'Cerveja', 55, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Anônimo', 'Realizada', 192.50),
(NULL, '2026-03-21', 'Coxinha', 32, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'João do Pulo', 'Realizada', 112.00),
(NULL, '2026-03-21', 'Cachaça', 65, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'Anônimo', 'Realizada', 117.00),
(NULL, '2026-03-22', 'Ovo rosa', 28, 2.50, 1.10, 'Granja Renascer', 'Apolo God', 'Zé da Esquina', 'Realizada', 39.20),
(NULL, '2026-03-22', 'Espetinho', 22, 8.00, 3.80, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Anônimo', 'Realizada', 92.40),
(NULL, '2026-03-22', 'Bolinho de carne', 18, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Sr. Wilson', 'Realizada', 63.00),
(NULL, '2026-03-23', 'Risoles', 15, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Anônimo', 'Realizada', 52.50),
(NULL, '2026-03-23', 'Quibe', 18, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Roberto', 'Realizada', 63.00),
(NULL, '2026-03-23', 'Empada', 25, 5.00, 2.10, 'Salgadaria Popular', 'Ártemis Sister', 'Anônimo', 'Realizada', 72.50),
(NULL, '2026-03-24', 'Torresmo', 35, 5.00, 1.80, 'Frigorífico Boi Gordo', 'Apolo God', 'Chico Mineiro', 'Realizada', 112.00),
(NULL, '2026-03-24', 'Batata frita', 12, 20.00, 8.50, 'Hortifruti do Campo', 'Ártemis Sister', 'Anônimo', 'Realizada', 138.00),
(NULL, '2026-03-24', 'Amendoim', 30, 3.00, 1.10, 'Snacks do Cerrado', 'Adônis Grega', 'Dona Maria', 'Realizada', 57.00),
(NULL, '2026-03-25', 'Ovo de codorna', 55, 1.00, 0.40, 'Granja Renascer', 'Apolo God', 'Anônimo', 'Realizada', 33.00),
(NULL, '2026-03-25', 'Azeitona', 15, 10.00, 4.20, 'Hortifruti do Campo', 'Ártemis Sister', 'Tião', 'Realizada', 87.00),
(NULL, '2026-03-25', 'Queijo coalho', 18, 7.00, 3.40, 'Laticínios da Serra', 'Adônis Grega', 'Anônimo', 'Realizada', 64.80),
(NULL, '2026-03-26', 'Linguiça calabresa', 10, 25.00, 11.00, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'João do Pulo', 'Realizada', 140.00),
(NULL, '2026-03-26', 'Pão com mortadela', 25, 8.00, 3.20, 'Salgadaria Popular', 'Adônis Grega', 'Anônimo', 'Realizada', 120.00),
(NULL, '2026-03-26', 'Sardinha', 30, 4.00, 1.70, 'Pescados da Costa', 'Apolo God', 'Zé da Esquina', 'Realizada', 69.00),
(NULL, '2026-03-27', 'Caldo de mocotó', 18, 12.00, 5.50, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Anônimo', 'Realizada', 117.00),
(NULL, '2026-03-27', 'Dobradinha', 12, 15.00, 6.80, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Sr. Wilson', 'Realizada', 98.40),
(NULL, '2026-03-27', 'Caldinho de feijão', 25, 10.00, 4.10, 'Hortifruti do Campo', 'Ártemis Sister', 'Anônimo', 'Realizada', 147.50),
(NULL, '2026-03-28', 'Refrigerante', 40, 5.00, 2.80, 'Distribuidora Cevada Pura', 'Adônis Grega', 'Roberto', 'Realizada', 88.00),
(NULL, '2026-03-28', 'Água tônica', 20, 6.00, 3.10, 'Distribuidora Cevada Pura', 'Apolo God', 'Anônimo', 'Realizada', 58.00),
(NULL, '2026-03-28', 'Cigarro', 80, 1.00, 0.65, 'Tabacaria Ouro Negro', 'Apolo God', 'Chico Mineiro', 'Realizada', 28.00),
(NULL, '2026-03-29', 'Isqueiro', 10, 6.00, 2.90, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Anônimo', 'Realizada', 31.00),
(NULL, '2026-03-29', 'Fósforo', 25, 1.00, 0.45, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Dona Maria', 'Realizada', 13.75),
(NULL, '2026-03-29', 'Paçoca', 35, 1.50, 0.60, 'Snacks do Cerrado', 'Adônis Grega', 'Anônimo', 'Realizada', 31.50),
(NULL, '2026-03-30', 'Chiclete', 120, 0.50, 0.15, 'Snacks do Cerrado', 'Apolo God', 'Tião', 'Realizada', 42.00),
(NULL, '2026-03-30', 'Conhaque', 18, 7.00, 3.90, 'Alambique Velho Oeste', 'Apolo God', 'Anônimo', 'Realizada', 55.80),
(NULL, '2026-03-30', 'Café', 45, 2.00, 0.80, 'Hortifruti do Campo', 'Apolo God', 'João do Pulo', 'Realizada', 54.00),
(NULL, '2026-03-31', 'Cerveja', 60, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Anônimo', 'Realizada', 210.00),
(NULL, '2026-03-31', 'Coxinha', 35, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Zé da Esquina', 'Realizada', 122.50),
(NULL, '2026-03-31', 'Cachaça', 70, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'Anônimo', 'Realizada', 126.00),
(NULL, '2026-01-05', 'Cachaça', 10, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'Zé da Esquina', 'Pendente', 18.00),
(NULL, '2026-01-07', 'Cerveja', 6, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'João do Pulo', 'Pendente', 21.00),
(NULL, '2026-01-08', 'Cigarro', 10, 1.00, 0.65, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Tião', 'Pendente', 3.50),
(NULL, '2026-01-10', 'Torresmo', 5, 5.00, 1.80, 'Frigorífico Boi Gordo', 'Apolo God', 'Sr. Wilson', 'Pendente', 16.00),
(NULL, '2026-01-12', 'Conhaque', 4, 7.00, 3.90, 'Alambique Velho Oeste', 'Apolo God', 'Roberto', 'Pendente', 12.40),
(NULL, '2026-01-15', 'Pão com mortadela', 4, 8.00, 3.20, 'Salgadaria Popular', 'Adônis Grega', 'Chico Mineiro', 'Pendente', 19.20),
(NULL, '2026-01-18', 'Caldo de mocotó', 3, 12.00, 5.50, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Dona Maria', 'Pendente', 19.50),
(NULL, '2026-01-20', 'Cachaça', 8, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'Zé da Esquina', 'Pendente', 14.40),
(NULL, '2026-01-22', 'Cerveja', 10, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'João do Pulo', 'Pendente', 35.00),
(NULL, '2026-01-25', 'Espetinho', 6, 8.00, 3.80, 'Frigorífico Boi Gordo', 'Adônis Grega', 'Tião', 'Pendente', 25.20),
(NULL, '2026-01-28', 'Linguiça calabresa', 2, 25.00, 11.00, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Roberto', 'Pendente', 28.00),
(NULL, '2026-01-30', 'Café', 10, 2.00, 0.80, 'Hortifruti do Campo', 'Apolo God', 'Chico Mineiro', 'Pendente', 12.00),
(NULL, '2026-02-02', 'Coxinha', 6, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Zé da Esquina', 'Pendente', 21.00),
(NULL, '2026-02-04', 'Cerveja', 8, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Sr. Wilson', 'Pendente', 28.00),
(NULL, '2026-02-05', 'Cigarro', 15, 1.00, 0.65, 'Tabacaria Ouro Negro', 'Apolo God', 'Tião', 'Pendente', 5.25),
(NULL, '2026-02-07', 'Cachaça', 12, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'João do Pulo', 'Pendente', 21.60),
(NULL, '2026-02-10', 'Dobradinha', 3, 15.00, 6.80, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Roberto', 'Pendente', 24.60),
(NULL, '2026-02-12', 'Bolinho de carne', 5, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Dona Maria', 'Pendente', 17.50),
(NULL, '2026-02-15', 'Queijo coalho', 4, 7.00, 3.40, 'Laticínios da Serra', 'Adônis Grega', 'Chico Mineiro', 'Pendente', 14.40),
(NULL, '2026-02-18', 'Caldinho de feijão', 5, 10.00, 4.10, 'Hortifruti do Campo', 'Ártemis Sister', 'Zé da Esquina', 'Pendente', 29.50),
(NULL, '2026-02-20', 'Cerveja', 12, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Sr. Wilson', 'Pendente', 42.00),
(NULL, '2026-02-22', 'Conhaque', 6, 7.00, 3.90, 'Alambique Velho Oeste', 'Apolo God', 'Roberto', 'Pendente', 18.60),
(NULL, '2026-02-24', 'Ovo rosa', 10, 2.50, 1.10, 'Granja Renascer', 'Apolo God', 'Tião', 'Pendente', 14.00),
(NULL, '2026-02-26', 'Espetinho', 8, 8.00, 3.80, 'Frigorífico Boi Gordo', 'Adônis Grega', 'João do Pulo', 'Pendente', 33.60),
(NULL, '2026-02-28', 'Sardinha', 10, 4.00, 1.70, 'Pescados da Costa', 'Apolo God', 'Chico Mineiro', 'Pendente', 23.00),
(NULL, '2026-03-02', 'Cerveja', 5, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Dona Maria', 'Pendente', 17.50),
(NULL, '2026-03-04', 'Cigarro', 20, 1.00, 0.65, 'Tabacaria Ouro Negro', 'Apolo God', 'Zé da Esquina', 'Pendente', 7.00),
(NULL, '2026-03-05', 'Cachaça', 10, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'Tião', 'Pendente', 18.00),
(NULL, '2026-03-07', 'Torresmo', 6, 5.00, 1.80, 'Frigorífico Boi Gordo', 'Apolo God', 'Sr. Wilson', 'Pendente', 19.20),
(NULL, '2026-03-09', 'Pão com mortadela', 5, 8.00, 3.20, 'Salgadaria Popular', 'Adônis Grega', 'Roberto', 'Pendente', 24.00),
(NULL, '2026-03-11', 'Caldo de mocotó', 4, 12.00, 5.50, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'João do Pulo', 'Pendente', 26.00),
(NULL, '2026-03-13', 'Coxinha', 8, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Chico Mineiro', 'Pendente', 28.00),
(NULL, '2026-03-15', 'Cerveja', 10, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Zé da Esquina', 'Pendente', 35.00),
(NULL, '2026-03-17', 'Linguiça calabresa', 3, 25.00, 11.00, 'Frigorífico Boi Gordo', 'Ártemis Sister', 'Dona Maria', 'Pendente', 42.00),
(NULL, '2026-03-19', 'Amendoim', 10, 3.00, 1.10, 'Snacks do Cerrado', 'Adônis Grega', 'Tião', 'Pendente', 19.00),
(NULL, '2026-03-21', 'Cachaça', 15, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'Sr. Wilson', 'Pendente', 27.00),
(NULL, '2026-03-22', 'Conhaque', 5, 7.00, 3.90, 'Alambique Velho Oeste', 'Apolo God', 'João do Pulo', 'Pendente', 15.50),
(NULL, '2026-03-24', 'Quibe', 6, 6.00, 2.50, 'Salgadaria Popular', 'Adônis Grega', 'Roberto', 'Pendente', 21.00),
(NULL, '2026-03-25', 'Batata frita', 2, 20.00, 8.50, 'Hortifruti do Campo', 'Ártemis Sister', 'Chico Mineiro', 'Pendente', 23.00),
(NULL, '2026-03-26', 'Café', 12, 2.00, 0.80, 'Hortifruti do Campo', 'Apolo God', 'Zé da Esquina', 'Pendente', 14.40),
(NULL, '2026-03-27', 'Cigarro', 12, 1.00, 0.65, 'Tabacaria Ouro Negro', 'Apolo God', 'Dona Maria', 'Pendente', 4.20),
(NULL, '2026-03-28', 'Cerveja', 8, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Tião', 'Pendente', 28.00),
(NULL, '2026-03-29', 'Paçoca', 15, 1.50, 0.60, 'Snacks do Cerrado', 'Adônis Grega', 'Sr. Wilson', 'Pendente', 13.50),
(NULL, '2026-03-29', 'Chiclete', 50, 0.50, 0.15, 'Snacks do Cerrado', 'Apolo God', 'Roberto', 'Pendente', 17.50),
(NULL, '2026-03-30', 'Cachaça', 20, 3.00, 1.20, 'Alambique Velho Oeste', 'Apolo God', 'João do Pulo', 'Pendente', 36.00),
(NULL, '2026-03-30', 'Empada', 10, 5.00, 2.10, 'Salgadaria Popular', 'Adônis Grega', 'Chico Mineiro', 'Pendente', 29.00),
(NULL, '2026-03-31', 'Caldinho de feijão', 6, 10.00, 4.10, 'Hortifruti do Campo', 'Ártemis Sister', 'Zé da Esquina', 'Pendente', 35.40),
(NULL, '2026-03-31', 'Cerveja', 12, 10.00, 6.50, 'Distribuidora Cevada Pura', 'Ártemis Sister', 'Sr. Wilson', 'Pendente', 42.00),
(NULL, '2026-03-31', 'Isqueiro', 2, 6.00, 2.90, 'Tabacaria Ouro Negro', 'Adônis Grega', 'Tião', 'Pendente', 6.20),
(NULL, '2026-03-31', 'Conhaque', 4, 7.00, 3.90, 'Alambique Velho Oeste', 'Apolo God', 'Roberto', 'Pendente', 12.40);

SELECT * FROM TRANSACTION
WHERE PROFIT > 0;

INSERT INTO EMPLOYEE VALUES
(NULL, 'Adônis Grega', 'Novo', 1834.45, 2025),
(NULL, 'Apolo God', 'Mais antigo', 1900.03, 2024),
(NULL, 'Ártemis Sister', 'Gerente', 2300.00, 2022);

SELECT * FROM EMPLOYEE;

ALTER TABLE CUSTOMER
MODIFY COLUMN ID INT AUTO_INCREMENT NOT NULL;

INSERT INTO CUSTOMER VALUES
(NULL, 'Dona Maria', '(11) 98765-4321', 'dona.maria@email.com.br'),
(NULL, 'Tião', '(11) 97654-3210', 'tiao.cliente@email.com.br'),
(NULL, 'João do Pulo', '(13) 99123-4567', 'joao.pulo@email.com.br'),
(NULL, 'Zé da Esquina', '(16) 98234-5678', 'ze.esquina@email.com.br'),
(NULL, 'Sr. Wilson', '(11) 96543-2109', 'sr.wilson@email.com.br'),
(NULL, 'Roberto', '(21) 99876-5432', 'roberto.silva@email.com.br'),
(NULL, 'Chico Mineiro', '(31) 98456-7890', 'chico.mineiro@email.com.br');

-- Inserir dados depois o INTO TABLE INVOICING

# 1. FATURAMENTO DO MÊS ATUAL
-- O faturamento inclui vendas fiadas

SELECT COALESCE(SUM(QUANTITY * ( PRICE - UNIT_COST)), 0) AS Lucro_Março
FROM TRANSACTION
WHERE MONTH(DATE) = 3;

SELECT COALESCE(SUM(PROFIT), 0) AS Faturamento_de_Março
FROM TRANSACTION
WHERE MONTH(DATE) = 3;

# 2. LUCRO DO ÚLTIMO MÊS

SELECT COALESCE(SUM(PROFIT), 0) AS Faturamento_de_Março
FROM TRANSACTION
WHERE STATUS = 'Realizada'
  AND MONTH(DATE) = 3;
  
 -- 2. a) Utilizando variação com equação matemática e data
  
SELECT COALESCE(SUM(QUANTITY * ( PRICE - UNIT_COST)), 0) AS Lucro_Março
FROM TRANSACTION
WHERE status = 'Realizada'
  AND DATE >= '2026-03-01'
  AND DATE <  '2026-04-01';

# 3. LUCRO DOS ÚLTIMOS 3 MESES
 -- OBS: O lucro é igual a somente o mês de Março, pois as vendas que de fato geraram lucro estão nesse mês 

SELECT COALESCE(SUM(PROFIT), 0) AS Lucro_Trimestre
FROM TRANSACTION
WHERE STATUS = 'Realizada'
AND MONTH(DATE) BETWEEN 1 AND 3;
 
SELECT COALESCE(SUM(PROFIT), 0) AS Lucro_Trimestre
FROM TRANSACTION
WHERE status = 'Realizada'
AND DATE >= '2026-01-01'
AND DATE <=  '2026-03-30';
 
SELECT COALESCE(SUM(PROFIT), 0) AS Lucro_Trimestre
FROM TRANSACTION
WHERE DATE >= DATE_SUB(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 3 MONTH)
AND DATE <  DATE_FORMAT(CURDATE(), '%Y-%m-01');

# 4. PRODUTO MAIS VENDIDO

SELECT PRODUCT, QUANTITY
FROM TRANSACTION
ORDER BY QUANTITY DESC
LIMIT 1;

# 5. PRODUTO MENOS VENDIDO

SELECT PRODUCT, QUANTITY
FROM TRANSACTION
ORDER BY QUANTITY ASC
LIMIT 1;

# 6. FUNCIONÁRIO QUE MAIS VENDEU
-- Quantidade de transações realizadas

SELECT EMPLOYEE,
COUNT(*) AS TOTAL
FROM TRANSACTION
GROUP BY EMPLOYEE
ORDER BY TOTAL DESC
LIMIT 1;

# 7. FUNCIONÁRIO QUE MENOS VENDEU
-- Quantidade de transações realizadas

SELECT EMPLOYEE,
COUNT(*) AS TOTAL
FROM TRANSACTION
GROUP BY EMPLOYEE
ORDER BY TOTAL ASC
LIMIT 1;

# 8. PRODUTO COM MAIOR LUCRO

SELECT PRODUCT AS PRODUCT,
SUM(PROFIT) AS TOTAL
FROM TRANSACTION
GROUP BY PRODUCT
ORDER BY TOTAL DESC
LIMIT 1;

# 9. PRODUTO COM MENOR LUCRO

SELECT PRODUCT AS PRODUCT,
SUM(PROFIT) AS TOTAL
FROM TRANSACTION
GROUP BY PRODUCT
ORDER BY TOTAL ASC
LIMIT 1;

# 10. TOTAL DE VENDAS POR DIA

SELECT DATE AS DATE,
SUM(PRICE) AS TOTAL
FROM TRANSACTION
GROUP BY DATE
ORDER BY DATE DESC;

# 11. CLIENTE QUE MAIS COMPROU
-- Quantidade de vezes que realizou transações

SELECT CUSTOMER AS CUSTOMER,
COUNT(*) AS TOTAL
FROM TRANSACTION
GROUP BY CUSTOMER
ORDER BY TOTAL DESC
LIMIT 1;

# 12.  PENSE EM ALGUMA QUERY QUE VÁ AJUDAR O SEU ZÉ A GANHAR MAIS DINHEIRO, PERDER MENOS DINHEIRO, TER UMA VISÃO MAIS ABRANGENTE OU DIMINUIR O RISCO
-- Produto que menos vendeu (quantidade) e deu mais lucro

SELECT PRODUCT,
    SUM(QUANTITY) AS QUANTITY,
    SUM(PROFIT) AS PROFIT
FROM TRANSACTION
GROUP BY PRODUCT
ORDER BY QUANTITY ASC, PROFIT DESC;


-- 13. É a mesma questão
-- Produto que mais vendeu (quantidade) e deu menos lucro

SELECT PRODUCT,
    SUM(QUANTITY) AS QUANTITY,
    SUM(PROFIT) AS PROFIT
FROM TRANSACTION
GROUP BY PRODUCT
ORDER BY QUANTITY DESC, PROFIT ASC;


# 14. QUAL CLIENTE MAIS COMPROU FIADO?
-- Observação: Tião realizou a mesma quantidade de transações fiadas

SELECT CUSTOMER AS CUSTOMER,
COUNT(*) AS TOTAL
FROM TRANSACTION
WHERE STATUS = 'Pendente'
GROUP BY CUSTOMER
ORDER BY TOTAL DESC
LIMIT 1;

# 15. QUAL É O PRODUTO QUE OS CLIENTES MAIS LEVAM SEM PAGAR NA HORA?

SELECT PRODUCT AS PRODUCT,
COUNT(*) AS TOTAL
FROM TRANSACTION
WHERE STATUS = 'Pendente'
GROUP BY PRODUCT
ORDER BY TOTAL DESC
LIMIT 1;

# 16. QUANTO O BAR DEIXOU DE ARRECADAR EM CADA MÊS (JANEIRO, FEVEREIRO E MARÇO)

SELECT MONTH(DATE) AS MONTH,
SUM(PRICE) AS INVOICING
FROM TRANSACTION
WHERE STATUS = 'Pendente'
GROUP BY MONTH(DATE)
ORDER BY MONTH DESC;



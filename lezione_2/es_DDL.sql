-- ATTENZIONE: Quando in una tabella si usa un campo "id" apposito per identificare in modo univoco un record
-- il valore di quel campo si deve incrementare in automatico

/* 1:
Crea una tabella chiamata "Products" con i seguenti campi:
- code (stringa esatta di 8 caratteri, chiave primaria)
- name (stringa di lunghezza massima 30 caratteri)
- price (decimale(6,2))
- quantity (intero)
nb: il valore assegnabile al campo quantità non supera il valore intero 100
*/
-- istrizione SQL di seguito
create table `Products`(
`code` char(8) not null,
`name` varchar(30) default null,
`price` decimal(6,2) default null,
`quantity` tinyint default null,
primary key(`code`)
);

/* 2:
Modifica la tabella "products" aggiungendo un nuovo campo chiamato "description" di tipo testo.
Inserite il nuovo campo dopo il campo "name"
*/
-- istrizione SQL di seguito
alter table `Products`
add column `description` text
after `name`;

/* 3:
Crea una tabella chiamata "orders" con i seguenti campi:
- id (intero, chiave primaria)
- order_date (data)
- total (decimale(10,2))
- shipping (tre possibili valori: delivered, shipped, to ship)
- shipping_address (stringa di lunghezza massima 100 caratteri)
- customer_id (intero)
*/
-- istrizione SQL di seguito
create table `orders`(
`id` int not null auto_increment,
`order_date` date default null,
`total` decimal(10,2) default null,
`shipping` enum('delivered','shipped','to ship') default null,
`shipping_address` varchar(100) default null,
`customer_id` int default null,
primary key(`id`)
);

/* 4:
Crea una tabella chiamata "Clienti" con i seguenti campi:
- id (intero, chiave primaria)
- first_name (stringa di lunghezza massima 30 caratteri)
- last_name (stringa di lunghezza massima 30 caratteri)
- email (stringa di lunghezza massima 100 caratteri)
- address (stringa di lunghezza massima 100 caratteri)
- city (stringa di lunghezza massima 50 caratteri)
- province (stringa di 2 caratteri)
- region (stringa di lunghezza massima 30 caratteri)
- registration_date (campo di tipo data)
*/
-- istrizione SQL di seguito
create table `Clienti`(
`id` int not null auto_increment,
`first_name` varchar(30) default null,
`last_name` varchar(30) default null,
`email` varchar(100) default null,
`address` varchar(100) default null,
`city` varchar(50) default null,
`province` char(2) default null,
`region` varchar(30) default null,
`registration_date` date default null,
primary key(`id`)
);

/* 5:
Modifica la tabella "clienti":
modifica la lunghezza massima del campo "last_name" da 30 caratteri a 50, 
aggiungi un nuovo campo chiamato "phone" dopo "last_name", di tipo stringa di lunghezza massima 20 caratteri e il campo "postal_code" (stringa di 5 caratteri) dopo il campo "region".
Scrivi un unica query.
*/
-- istrizione SQL di seguito
alter table `Clienti`
modify `last_name` varchar(50) default null,
add column `phone` varchar(20) default null
after `last_name`,
add column `postal_code` char(5) default null
after `region`;

/* 6:
Crea le tabelle "America", "Asia", "Africa" (3 query)
Le tabelle hanno i seguenti attributi:
- id (intero, chiave primaria)
- state (stringa di lunghezza massima 50 caratteri)
- capital_id (intero con il valore massimo 255)
- population (numero intero: considera che il paese più popoloso al mondo attualmente è l'india con 1.428.627.663 abitanti )
*/
-- istrizione SQL di seguito
create table `America`(
`id` int not null auto_increment,
`state` varchar(50) default null,
`capital_id` tinyint default null,
`population` int default null,
primary key(`id`)
);

create table `Asia`(
`id` int not null auto_increment,
`state` varchar(50) default null,
`capital_id` tinyint default null,
`population` int default null,
primary key(`id`)
);

create table `Africa`(
`id` int not null auto_increment,
`state` varchar(50) default null,
`capital_id` tinyint default null,
`population` int default null,
primary key(`id`)
);

/* 7
Crea una tabella chiamata "Books" con i seguenti campi:
- ISBN (codice di 13 cifre, chiave primaria)
- title (stringa di lunghezza massima 100 caratteri)
- price (decimale(6,2))
- price_VAT (decimale(6,2))
- pages (intero)
- editor_id (intero)
*/
-- istrizione SQL di seguito
create table `Books`(
`ISBN` char(13) not null,
`title` varchar(100) default null,
`price` decimal(6,2) default null,
`price_VAT` decimal(6,2) default null,
`pages` int default null,
`editor_id` int default null,
primary key(`ISBN`)
);

/* 8:
Rinomina la tabella "clienti": il nuovo nome è "customers".
*/
-- istrizione SQL di seguito
rename table `Clienti` to `customers`;
drop table demo, test;

create table if not exists `studenti`(
	`id` int not null auto_increment,
	`nome` varchar(20) default null,
    `cogn` varchar(30) not null,
    `gen` enum('m', 'f', 'nb') default null,
    `indirizzo` varchar(100) default null,
    `citta` varchar(30) default null,
    `provincia` char(2) default 'to',
    `regione` varchar(30) default null,
    `email` varchar(100) not null unique,
    `data_nascita` date default null,
    `created_at` timestamp default current_timestamp,
    `updated_at` timestamp default current_timestamp on update current_timestamp,
    primary key(`id`)
);

alter table `studenti`
modify `nome` varchar(30) default null;

desc `studenti`;

alter table `studenti`
change `cogn` cognome varchar(50) not null;

alter table `studenti`
rename column `gen` to `genere`;

alter table `studenti`
add column `eta` tinyint;

alter table `studenti`
drop `eta`,
add column `eta` tinyint
after `data_nascita`;

alter table `studenti`
add column `demo` varchar(30)
first;

alter table `studenti`
drop `eta`;

create table `studenti_bk` like `studenti`;

show tables;

desc `studenti`;
desc `studenti_bk`;

show create table `studenti`;

alter table `studenti`
modify `genere` enum('f', 'm', 'nb') default null;

drop table `studenti_bk`;
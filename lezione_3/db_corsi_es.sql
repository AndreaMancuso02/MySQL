create table Docenti(
id tinyint unsigned auto_increment,
nome varchar(50) not null,
cognome varchar(50) not null,
email varchar(100) not null unique,
primary key(id)
);

create table Corsi(
id int auto_increment,
titolo varchar(100) not null,
prezzo decimal(6,2) not null,
docente_id tinyint unsigned,
constraint fk_corsi_docenti
foreign key(docente_id) references docenti(id)
on update cascade
on delete restrict,
primary key(id)
);

create table Studenti(
id int auto_increment,
nome varchar(50) not null,
cognome varchar(50) not null,
genere enum('f','m','nb'),
indirizzo varchar(100),
cita varchar(30),
provincia char(2) default 'to',
regione varchar(30) default 'Piemonte',
email varchar(100) not null unique,
data_nascita date,
data_registrazione timestamp default current_timestamp,
primary key(id)
);

create table Iscrizioni(
id int auto_increment,
studente_id int not null,
corso_id int not null,
prezzo decimal(6,2) not null,
data_iscrizione timestamp default current_timestamp,
constraint fk_iscrizioni_studenti
foreign key(studente_id) references studenti(id)
on update cascade
on delete restrict,
constraint fk_iscrizioni_corsi
foreign key(corso_id) references corsi(id)
on update cascade
on delete restrict,
primary key(id)
);

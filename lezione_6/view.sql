-- VIEW	
# Limitano l’accesso ai dati sensibili: puoi mostrare solo alcune colonne o righe di una tabella

# Mascherano la complessità del database: l’utente non deve conoscere i dettagli delle join o dei filtri

# Riduzione dell’impatto dei cambiamenti: 
# se cambia la struttura delle tabelle, puoi aggiornare solo la vista

# Semplificano le query: permettono di ottenere risultati complessi usando una SELECT semplice

create view studenti_info as
select nome, cognome, email
from studenti;

show tables;
show full tables;

# Per rinominare la view, modificarne solo il nome, potete scrivere:
rename table studenti_info to vw_studenti_info;

# come modificare la query
# CREATE OR REPLACE VIEW sovrascrive la vista se esiste, ma cancella eventuali privilegi associati
# ALTER VIEW mantiene i privilegi già assegnati alla vista

alter view vw_studenti_info as
select nome, cognome, email
from studenti
where provincia = 'to';

select * from vw_studenti_info
where cognome like 'v%';

show create view vw_studenti_info;

# eliminare una lista
drop view vw_studenti_info;

desc studenti;

create view vw_studenti_info as
select nome, cognome, email
from studenti;

update vw_studenti_info
set email = 'ffrrss@icloud.com'
where cognome = 'rossi' and nome = 'franco';

select * from vw_studenti_info
order by cognome, nome;

insert into vw_studenti_info(nome, cognome, email)
values('mauro','sacchi','mscc@icloud.com');

select * from studenti;

create view vw_iscritti_info as
select s.cognome, s.nome, s.genere, s.email, c.titolo, i.prezzo, i.data_iscrizione
from studenti s
join iscrizioni i on s.id = i.studente_id
join corsi c on c.id = i.corso_id;

show tables;

alter view vw_iscritti_info as
select 
	s.cognome `Cognome`, 
    s.nome `Nome`, 
    s.genere `Genere`, 
    s.email `Contatto`, 
    c.titolo `Corso`, 
    i.prezzo `Prezzo pagato`, 
    i.data_iscrizione `Data iscrizione`
from studenti s
join iscrizioni i on s.id = i.studente_id
join corsi c on c.id = i.corso_id;

select titolo, count(*) as Quanti
from vw_iscritti_info
group by titolo
order by Quanti desc;

select * from vw_iscritti_info order by cognome;


select cognome, nome, nome_corsi
from docenti d
join catalogo_corsi c
using(docente_id)
order by nome_corsi;

select cognome, nome, nome_corsi
from docenti d
join catalogo_corsi c
using(docente_id)
where nome_corsi = 'CSS';

select cognome, nome, nome_corsi
from docenti d
join catalogo_corsi c
using(docente_id)
where cognome = 'Rossi' and nome = 'Paolo';

# cambiamento nome tabella e colonna
-- tabella
-- corsi -> catalogo_corsi
-- attributo
-- titolo -> nome_corso

rename table corsi to catalogo_corsi;
alter table catalogo_corsi rename column titolo to nome_corsi;

alter view corsi_info as 
select cognome, nome, titolo nome_corsi
from docenti 
join corsi catalogo_corsi
using(docente_id);

rename table catalogo_corsi to corsi;
alter table corsi rename column nome_corsi to titolo;

select cognome, nome, nome_corsi from corsi_info;
select cognome, nome, nome_corsi from corsi_info where nome_corsi = 'CSS';
select cognome, nome, nome_corsi from corsi_info where cognome = 'Rossi' and nome = 'Paolo';

-- query su base table
select cognome, nome, titolo
from docenti d
join corsi c
using(docente_id)
where titolo = 'CSS';

-- query su vista
select cognome, nome, titolo
from corsi_info
where titolo = 'CSS';

alter table corsi rename column titolo to nome_corsi;

alter view corsi_info as 
select cognome, nome, nome_corsi titolo
from docenti 
join corsi catalogo_corsi
using(docente_id);

create view vw_iscrizioni_limitata as 
select
	s.nome `Nome`, 
    s.cognome `Cognome`, 
    c.nome_corsi `Titolo`, 
    i.data_iscrizione `Data Iscrizione`
from studenti s
join iscrizioni i 
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id;


select * from vw_iscrizioni_limitata;

create or replace view vw_iscritti_info as
select 
	s.cognome `Cognome`, 
    s.nome `Nome`, 
    s.genere `Genere`, 
    s.email `Contatto`, 
    c.nome_corsi `Corso`, 
    i.prezzo `Prezzo pagato`, 
    i.data_iscrizione `Data iscrizione`
from studenti s
join iscrizioni i on s.id = i.studente_id
join corsi c on c.id = i.corso_id;

-- VIEW CON CHECK OPTION

CREATE VIEW studenti_v AS
SELECT id, nome, cognome, email, provincia
FROM studenti
WHERE provincia = 'to';

select * from studenti_v;

update studenti_v
set provincia = 'cn'
where id = 7;

alter VIEW studenti_v AS
SELECT id, nome, cognome, email, provincia
FROM studenti
WHERE provincia = 'to'
with check option;

# with check option serve a rendere restrittivo il where e quindi non potrà essere modificato

insert into studenti_v(nome, cognome, email, provincia)
values ('paolo','picchio','pppppicchio@gmail.com','to');

# posso inserire solo utenti con provincia = to perche limitata dal with check option
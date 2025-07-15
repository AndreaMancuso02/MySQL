-- 1)
-- Create una vista che mostri il cognome, il nome, l'email degli studenti
-- chiamate la vista "studenti_info"
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- cognome, il nome, l'email
create view studenti_info as
select cognome, nome, email
from studenti;

/*
-- 2)
Creare una vista che mostri gli studenti divisi in base alle Generazioni
-- chiamate la vista "studenti_generazioni"
-- considerando i periodi seguenti per l'assegnazione delle generazioni:
-- Baby boomers o "Boomers" (1946-1964)
-- Generazione X (1965-1979)
-- Generazione Y o “Millennials” (1980-1996)
-- Generazione Z o "Centennials" (1997-2012)
-- Generazione Alpha o "Screenagers" (2013-2024)
-- Generazione Beta (2025-2038)
-- (non importa che i record della tabella non coprano tutte le casisitiche: mi
interessa la query)
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- nome, cognome, indirizzo, citta, provincia, regione, email, data_nascita,
generazione
*/
create view studenti_generazioni as
select nome, cognome, indirizzo, citta, provincia, regione, email, data_nascita `Data Nascita`,
case
	when year(data_nascita) between 1946 and 1964 then 'Boomers'
	when year(data_nascita) between 1965 and 1979 then 'X'
	when year(data_nascita) between 1980 and 1996 then 'Millennials'
	when year(data_nascita) between 1997 and 2012 then 'Centennials'
	when year(data_nascita) between 2013 and 2024 then 'Screenagers'
	when year(data_nascita) between 2025 and 2038 then 'Beta'
	when year(data_nascita) is null then 'Manca la data di nascita'
end Generazione
from studenti;
    

-- 3)
-- Create una vista che mostri il cognome, il nome, l'email del docente e corsi assegnati
-- chiamate la vista "docenti_corsi"
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- cognome, il nome, l'email, corso (usate alias nella vista)
create view docenti_corsi as
select d.cognome, d.nome, d.email, c.nome_corsi
from docenti d
join corsi c
using(docente_id);

-- 4)
-- Create una vista che mostri solo i docenti per i quali non esistono corsi assegnati
-- chiamate la vista "docenti_nocorsi"
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- cognome, nome, email
create view docenti_nocorsi as
select cognome, nome, email
from docenti 
left join corsi
using(docente_id);

-- 5)
-- Create una vista che mostri solo i corsi per i quali non esistono docenti assegnati
-- chiamate la vista "corsi_nodocenti"
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- titolo
create view corsi_nodocenti as
select nome_corsi
from docenti
right join corsi
using (docente_id);

-- 6)
-- Create una vista che mostri solo gli studenti iscritti
-- chiamate la vista "studenti_iscritti"
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- cognome, nome, email, indirizzo, provincia, regione
create view studenti_iscritti as
select cognome, nome, email, indirizzo, provincia, regione
from studenti s
join iscrizioni i
on s.id = i.studente_id;

-- 7)
-- Create una vista che mostri solo gli studenti non iscritti
-- chiamate la vista "studenti_noiscritti"
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- cognome, nome, email, indirizzo, provincia, regione
create view studenti_noiscritti as
select cognome, nome, email, indirizzo, regione
from studenti s
left join iscrizioni i
on s.id = i.studente_id
where i.studente_id is null;

-- 8)
-- Create una vista che mostri gli studenti iscritti ai corsi che hanno più di 30 anni,
-- e il corso a cui sono iscritti
-- chiamate la vista "iscritti_over30"
-- le intestazioni delle colonne risultanti della vista dovranno essere:
-- cognome, nome, email, età (usate funzione per calcloare età e alias per l'intestazione della colonna ), titolo as corso
create view iscritti_over30 as
select 
	s.cognome, 
    s.nome, 
    s.email, 
    timestampdiff(year, data_nascita, curdate()) `eta`,
    c.nome_corsi `titolo corso`
from studenti s
join iscrizioni i
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id
where `eta` > 30;



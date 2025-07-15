-- SUBQUERY
-- Scrivete le query richieste usando le subquery
-- RICORDATEVI che dovete conoscere come sono organizzati i dati per capire dove andare a prenderli

-- DB corsi
-- 01 selezionate titolo, prezzo dei corsi che costano meno del prezzo medio totale dei corsi
select avg(prezzo) from corsi;
select nome_corsi, prezzo
from corsi
where prezzo < (select avg(prezzo) from corsi)
order by prezzo desc;

-- 02) Seleziona cognome, nome, email degli studenti non iscritti ad alcun corso
-- e ordina per cognome
select s.cognome, s.nome, s.email
from studenti s
left join iscrizioni i
on s.id = i.studente_id
where i.studente_id is null
order by cognome;

-- 03) contate gli studenti non iscritti ad alcun corso
select count(*)
from studenti s
left join iscrizioni i
on s.id = i.studente_id
where i.studente_id is null;

-- DB gestionale
-- 04) Selezionate nome, cognome, ruolo degli impiegati che lavorano nella città di Milano
select nome, cognome, ruolo
from impiegati
where ufficio_id = any 
	(select id from uffici where citta = 'milano');

-- 05) Selezionate cognome, nome, email del cliente che ha eseguito il primo ordine
-- attenzione il primo ordine NON ha necessariamente id = 1
-- aiuto: join + subquery oppure 2 subquery nidificate in query princiaple
select c.cognome, c.nome, c.email
from clienti c
join ordini o
on c.id = o.cliente_id
where o.data = (select min(o.data) from ordini);

-- 06) inserite un ordine di 10 monitor per il cliente "Bruni Carlo" che ha ID = 7
-- con data di oggi, stato di consegna: "da spedire"
-- dovete scrivere due query
-- inserite prima record in tabella ordine
-- inserite il dettaglio nella tabella ordini_dettaglio
-- ricordandovi della funzione last_insert_id()
-- q01
insert into ordini (cliente_id, `data`, consegna)
values(7, curdate(), 'da spedire');

-- q02
insert into ordini_dettaglio (ordine_id, articolo_id, quantita)
select last_insert_id(), (select id from articoli where descrizione = 'Monitor'), 10;

-- 07) selezionate elenco dei corsi con il valore massimo di iscritti
-- ricordatevi dell'operatore ALL, fate riferimento alla slide
select c.nome_corsi, count(i.studente_id) `Numero iscritti`
from corsi c
join iscrizioni i
on c.id = i.corso_id
group by c.nome_corsi
having count(i.studente_id) >= all (
		select count(studente_id)
        from iscrizioni
        group by corso_id
	);


select * from impiegati;

select stipendio from impiegati where id = 6;
-- 1500
select nome, cognome, stipendio
from impiegati 
where stipendio > 1500.00
order by stipendio desc;

select nome, cognome, stipendio
from impiegati 
where stipendio > (select stipendio from impiegati where id = 6)
order by stipendio desc;
# Una subquery è un'istruzione SELECT all'interno di un'altra istruzione SQL
# Una subquery MySQL può essere nidificata all'interno di un’altra subquery
# Una subquery viene in genere aggiunta all'interno della condizione WHERE di un'altra istruzione SELECT

-- VANTAGGI
# Consentono query strutturate in modo che sia possibile isolare ogni parte di una dichiarazione
# Forniscono metodi alternativi per eseguire operazioni che altrimenti richiederebbero UNION e JOIN complesse
# Molti trovano le subquery più leggibili rispetto a UNION o JOIN complesse


-- db corsi
# prendo i corsi con prezzo superiore al prezzo medio
select avg(prezzo) from corsi;
select nome_corsi, prezzo
from corsi
where prezzo > (select avg(prezzo) from corsi)
order by prezzo desc;

# prendo i corsi con prezzo massimo
select max(prezzo) from corsi;
select nome_corsi, prezzo
from corsi
where prezzo = (select max(prezzo) from corsi);

-- db gestionale
# selezionare l ultimo ordine inserito
select max(id) from ordini;
select c.cognome, c.nome, c.email, o.id
from clienti c
join ordini o
on c.id = o.cliente_id
where o.id = (select max(id) from ordini);

-- subquery dentro subquery
select max(id) from ordini;

select cliente_id 
from ordini 
where id = (select max(id) from ordini);

select cognome, nome,email
from clienti
where id = 
	(select cliente_id 
	from ordini 
	where id = (select max(id) from ordini));
-- fine esempio

# impiegati che vengono pagati di piu dello stip medio
select avg(stipendio) from impiegati;

select cognome, nome, stipendio
from impiegati
where stipendio > (select avg(stipendio) from impiegati)
order by stipendio desc;

# stipendio medio degli impiegati raggruppati per uffici
select  u.nome, avg(stipendio) `stipendio medio`
from impiegati i
join uffici u
on i.ufficio_id = u.id
group by ufficio_id
having avg(stipendio) >= all
	(select avg(stipendio) `stipendio medio`
	from impiegati i
	join uffici u
	on i.ufficio_id = u.id
	group by ufficio_id);


select nome, cognome, stipendio
from impiegati 
where stipendio >= all (select stipendio from impiegati where cognome = 'barba')
order by stipendio desc;

select cognome, nome
from impiegati
where ufficio_id = any 
	(select id from uffici where regione = 'piemonte');

select 'Piemonte' Regione, count(*) Quanti
from impiegati
where ufficio_id = any 
	(select id from uffici where regione = 'piemonte');

-- IN, NOT IN
select distinct cognome, nome
from clienti c
join ordini o
on c.id = o.cliente_id
order by cognome;
# distinct per non ripetere le righe

select cognome, nome
from clienti
where id in (select distinct cliente_id from ordini);

select cognome, nome
from clienti c
left join ordini o
on c.id = o.cliente_id
where o.id is null
order by cognome;

select cognome, nome
from clienti
where id not in (select cliente_id from ordini);

use app_java2025;

select * from parenti;
select * from amici;

-- ROW(colonna1, colonna2, colonna_n)

select nome, cognome from amici
where row(nome,cognome)  = row('franco','rossi');

select nome, cognome from amici
where row(nome,cognome) = (select nome, cognome from parenti where id = 15);


-- SUBQUERY correlate
use gestionale;

select * from articoli;
update articoli set rimanenza = 100;

select * from ordini_dettaglio;

select descrizione, sum(quantita)
from ordini_dettaglio od 
join articoli a
on a.id = od.articolo_id
group by articolo_id;

update articoli a
set rimanenza = rimanenza - (
	select sum(quantita)
    from ordini_dettaglio od
    where a.id = od.articolo_id
);

select * from articoli;

-- ifnull funzione di mysql
update articoli a
set rimanenza = rimanenza - 
	ifnull(
		(select sum(quantita)
		from ordini_dettaglio od
		where a.id = od.articolo_id)
        , 0
	);

update articoli a
set rimanenza = rimanenza - 
	coalesce(
		(select sum(quantita)
		from ordini_dettaglio od
		where a.id = od.articolo_id)
        , 0
	);
    
select * from clienti;
update clienti set credito = 0;

UPDATE clienti c
SET credito = COALESCE(
	(
	SELECT SUM(od.prezzo * od.quantita)
	FROM ordini o
	JOIN ordini_dettaglio od ON o.id = od.ordine_id
	WHERE o.cliente_id = c.id
	), 0
);


SELECT cognome, nome
FROM clienti c
WHERE EXISTS
(SELECT 1 FROM ordini o WHERE o.cliente_id = c.id);

-- SUBQUERY in FROM
use corsi;
select * from vw_studenti_info;

select * from
	(select nome,cognome,email
	from studenti) as tbl;

use gestionale;

select sum(quantita) `q aritcoli`
from ordini_dettaglio
group by ordine_id;

select max(`q aritcoli`), min(`q aritcoli`), avg(`q aritcoli`)
from (
	select sum(quantita) `q aritcoli`
	from ordini_dettaglio
	group by ordine_id
) as tbl;

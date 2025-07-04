-- INNER JOIN e OUTER JOIN (slide pag 181)
use corsi;
select cognome, nome, titolo as `Titolo del corso`
from docenti as d 		# la prima chiamata è la tabella di sinistra
inner join corsi as c 	# la seconda è chiamata tabella di destra
on d.id = c.docente_id
where titolo = 'html'
order by `Titolo del corso`;

select cognome, nome, titolo as `Titolo del corso`
from docenti as d
left join corsi as c
on d.id = c.docente_id
order by `Titolo del corso`;
# in questo esempio verranno presi i dati in comune tra le due e i dati della tabella
# di sinistra che in questo caso è "docenti" quindi risulteranno i docenti senza un corso

select cognome, nome, titolo as `Titolo del corso`
from docenti as d
right join corsi as c
on d.id = c.docente_id
order by `Titolo del corso`;
# in questo esempio verranno presi i dati in comune tra le due e i dati della tabella
# di destra che in questo caso è "corsi" quindi risulteranno i corsi senza un docente assegnato

select cognome, nome
from docenti as d
left join corsi as c
on d.id = c.docente_id
where c.id is null
order by cognome;
# in questo esempio verrano presi i dati della tabella di sinistra che in questo caso è
# "docenti" dove i docenti non hanno corsi assegnati


select titolo
from docenti as d
right join corsi as c
on d.id = c.docente_id
where d.id is null
order by titolo;
# in questo esempio verrano presi i dati della tabella di destra che in questo caso è
# "corsi" dove i corsi non hanno docenti assegnati

# JOIN CON 3 TABELLE
select cognome, nome, titolo
from studenti s
join iscrizioni i 
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id
order by titolo;

select cognome, nome, titolo
from studenti s
left join iscrizioni i 
on s.id = i.studente_id
left join corsi c
on c.id = i.corso_id
order by titolo;
# in questo esempio abbiamo preso anche gli studenti non iscritti ad alcun corso

select cognome, nome, titolo
from studenti s
join iscrizioni i 
on s.id = i.studente_id
right join corsi c
on c.id = i.corso_id
order by cognome;
# qui prendiamo anche i corsi senza iscrizioni

-- FULL OUTER JOIN, gli esclusi
select cognome, nome, titolo
from docenti as d
left join corsi as c
on d.id = c.docente_id
where c.id is null
union
select cognome, nome, titolo
from docenti as d
right join corsi as c
on d.id = c.docente_id
where d.id is null
order by cognome;

-- FULL OUTER JOIN, tutti
select cognome, nome, titolo
from docenti as d
left join corsi as c
on d.id = c.docente_id
union
select cognome, nome, titolo
from docenti as d
right join corsi as c
on d.id = c.docente_id
order by cognome;

-- SELF JOIN
select * from impiegati;
select i.cognome, i.nome, i.ruolo, r.cognome RespC, r.nome RespN
from impiegati r
join impiegati i
on i.id_responsabile = r.id
order by ruolo;

select * from impiegati;
select i.cognome, i.nome, i.ruolo, r.cognome RespC, r.nome RespN
from impiegati i
left join impiegati r
on i.id_responsabile = r.id
order by ruolo;


alter table docenti
rename column id to docente_id;
select * from docenti;

select cognome, nome, titolo
from docenti
join corsi
using(docente_id)
order by titolo;

-- CROSS JOIN
select cognome, nome, titolo
from docenti join corsi;

create table prodotti(
id int auto_increment primary key,
prodotto varchar(50)
);
insert into prodotti(prodotto)values('tazza'),('maglietta'),('penna');

create table colori(
id int auto_increment primary key,
colore varchar(50)
);
insert into colori(colore)values('giallo'),('verde'),('blu');

select * from prodotti;
select * from colori;

select prodotto, colore
from prodotti
cross join colori;
# La CROSS JOIN restituisce il prodotto cartesiano di due tabelle:
# ogni riga della prima tabella viene combinata con tutte le righe della seconda


-- JOIN in UPDATE e DELETE
update corsi c
left join docenti d
on d.docente_id = c.docente_id
set prezzo = prezzo * 0.90
where d.docente_id is null;
# il prezzo originario era di 250€
select prezzo from corsi where titolo = "Angular";
# ora il prezzo è di 225€

--

select docente_id, cognome, nome 
from docenti
left join corsi
using(docente_id)
where corsi.id is null;
#questi sono i docenti senza corsi assegnati (2)

delete docenti 
from docenti
left join corsi
using(docente_id)
where corsi.id is null;
#eliminiamo i docenti senza corsi assegnati

create table generazioni(
id int auto_increment primary key,
generazione varchar(20),
anno_inizio date,
anno_fine date
);

insert into generazioni(generazione, anno_inizio, anno_fine)
values
('Boomers', '1946-01-01', '1964-12-31'),
('X', '1965-01-01', '1980-12-31'),
('Millennials', '1981-01-01', '1996-12-31'),
('Z', '1997-01-01', '2011-12-31');

select * from generazioni;

select s.cognome, s.nome, s.data_nascita, g.generazione
from studenti s
join generazioni g
on s.data_nascita
between g.anno_inizio and g.anno_fine
order by s.data_nascita;


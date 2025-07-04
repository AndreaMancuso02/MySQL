-- USARE SINTASSI JOIN
-- corsi, docenti
/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
select d.cognome, d.nome, d.email, c.titolo
from docenti d
join corsi c
on d.docente_id = c.docente_id
order by d.cognome, d.nome;

/* 2
Seleziona il titolo del corso con prezzo inferiore a 200€ (non incluso)
e cognome, nome, email dei docenti che insegnano in quel corso,
ordina per prezzo in modo discendente
*/
select c.titolo, c.prezzo, d.cognome, d.nome, d.email
from docenti d 
join corsi c
on d.docente_id = c.docente_id
where c.prezzo < 200
order by c.prezzo desc;

/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso HTML
*/
select d.cognome, d.nome, d.email
from docenti d 
join corsi c
on d.docente_id = c.docente_id
where c.titolo = "HTML";

/* 4
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
select d.cognome, d.nome, d.email, c.titolo
from docenti d 
left join corsi c
on d.docente_id = c.docente_id
order by c.titolo, d.cognome, d.nome;

/* 5
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I CORSI CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
select d.cognome, d.nome, d.email, c.titolo
from docenti d 
right join corsi c
on d.docente_id = c.docente_id
order by c.titolo, d.cognome, d.nome;

/* 6
Seleziona cognome, nome, email
SOLO DEI DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per cognome e nome
*/
select d.cognome, d.nome, d.email
from docenti d
left join corsi c
on d.docente_id = c.docente_id
where c.id is null
order by d.cognome, d.nome;

/* 7
Seleziona titolo SOLO DEI CORSI 
CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo
*/
select c.titolo
from docenti as d
right join corsi as c
on d.docente_id = c.docente_id
where d.docente_id is null
order by c.titolo;

-- studenti, corsi, iscrizioni
/* 8
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per titolo, cognome e nome
*/
select s.cognome, s.nome, s.email, c.titolo
from studenti s
join iscrizioni i 
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id
order by c.titolo, s.cognome, s.nome;

/* 9
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
select s.cognome, s.nome, s.email
from studenti s
join iscrizioni i 
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id
where c.titolo = "Java"
order by s.cognome, s.nome;

/* 10a
Seleziona cognome, nome, email, degli studenti 
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
select s.cognome, s.nome, s.email
from studenti s
join iscrizioni i 
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id
where i.prezzo >= 200
order by s.cognome, s.nome;

-- 10b Aggiungi il titolo corso alla query precedente
select s.cognome, s.nome, s.email, c.titolo
from studenti s
join iscrizioni i 
on s.id = i.studente_id
join corsi c
on c.id = i.corso_id
where i.prezzo >= 200
order by s.cognome, s.nome;

/* 11
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE GLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per titolo, cognome e nome
*/
select s.cognome, s.nome, s.email, c.titolo
from studenti s
left join iscrizioni i 
on s.id = i.studente_id
left join corsi c
on c.id = i.corso_id
order by c.titolo, s.cognome, s.nome;

/* 12
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo, cognome e nome
*/
select s.cognome, s.nome, s.email, c.titolo
from studenti s
right join iscrizioni i 
on s.id = i.studente_id
right join corsi c
on c.id = i.corso_id
order by c.titolo, s.cognome, s.nome;

/* 13
Seleziona cognome, nome, email
SOLO DEGLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per cognome e nome
*/
select s.cognome, s.nome, s.email
from studenti s
left join iscrizioni i 
on s.id = i.studente_id
left join corsi c
on c.id = i.corso_id
where c.id is null 
order by s.cognome, s.nome;

/* 14
Seleziona titolo del corso
SOLO PER I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo
*/
select c.titolo
from studenti s
right join iscrizioni i 
on s.id = i.studente_id
right join corsi c
on c.id = i.corso_id
where i.id is null
order by c.titolo;
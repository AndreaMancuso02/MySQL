/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
select docenti.cognome, docenti.nome, docenti.email, corsi.titolo
from docenti, corsi
where docenti.id = corsi.docente_id
order by docenti.cognome, docenti.nome;
/* 2
Seleziona il titolo del corso con prezzo inferiore a 200€ (non incluso)
e cognome, nome, email dei docenti che insegnano in quel corso,
ordina per prezzo in modo discendente
*/
select corsi.titolo, docenti.cognome, docenti.nome, docenti.email
from docenti, corsi
where docenti.id = corsi.docente_id and corsi.prezzo < 200
order by corsi.prezzo desc;
/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso di React
*/
select docenti.cognome, docenti.nome, docenti.email
from docenti, corsi
where docenti.id = corsi.docente_id and corsi.titolo = "React";
/* 4
Seleziona titolo corso/i insegnati dal docente il cui cognome è Rossi e il cui nome è Paolo,
mostra anche l'email
e ordina per titolo corso
*/
select corsi.titolo, docenti.email
from docenti, corsi
where docenti.id = corsi.docente_id and docenti.cognome = "Rossi" and docenti.nome = "Paolo"
order by corsi.titolo;
/* 5
Seleziona cognome, nome, email dei docenti
che insegnano nei corsi il cui titolo comincia per 'Introduzione'
e ordina per titolo, cognome e nome
*/
select docenti.cognome, docenti.nome, docenti.email
from docenti, corsi
where docenti.id = corsi.docente_id and corsi.titolo like "Introduzione %"
order by corsi.titolo, docenti.cognome, docenti.nome;
/* 6
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email, corsi.titolo
from studenti, corsi, iscrizioni
where iscrizioni.studente_id = studenti.id and iscrizioni.corso_id = corsi.id
order by studenti.cognome, studenti.nome;
/* 7
Seleziona cognome, nome, email, degli studenti di genere FEMMINA
e titolo corso a cui sono iscritte
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email
from studenti, corsi, iscrizioni
where iscrizioni.studente_id = studenti.id and iscrizioni.corso_id = corsi.id and studenti.genere = 'f'
order by studenti.cognome, studenti.nome;
/* 8
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email
from studenti, corsi, iscrizioni
where iscrizioni.studente_id = studenti.id and iscrizioni.corso_id = corsi.id and corsi.titolo = "Java"
order by studenti.cognome, studenti.nome;
/* 9
Seleziona cognome, nome, email, degli studenti MASCHI
iscritti al corso di Basi di dati
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email
from studenti, corsi, iscrizioni
where iscrizioni.studente_id = studenti.id and iscrizioni.corso_id = corsi.id and studenti.genere = 'm' and corsi.titolo = "Basi di dati"
order by studenti.cognome, studenti.nome;
/* 10
Seleziona cognome, nome, email, degli studenti
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email
from studenti, corsi, iscrizioni
where iscrizioni.studente_id = studenti.id and iscrizioni.corso_id = corsi.id and iscrizioni.prezzo >= 200
order by studenti.cognome, studenti.nome;
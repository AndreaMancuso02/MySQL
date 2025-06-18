-- VERIFICATE SEMPRE che i dati restituiti siano coerenti con la query
/*
1
seleziona gli studenti
il cui cognome è uguale a 'bianchi' e ordina per cognome
*/
select * from studenti
where cognome = 'bianchi'
order by cognome;
/*
2
seleziona gli studenti, ordinali per cognome e mostra solo i primi 10 record
*/
select * from studenti
order by cognome
limit 0, 10;
/*
3
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui genere è 'maschio' e ordina per data di nascita
*/
select cognome, nome, email, data_nascita
from studenti
where genere = 'm'
order by data_nascita;
/*
4
seleziona il cognome, il nome, l'indirizzo, la città, la provincia, l'email e la data di nascita
dalla tabella studenti
la cui regione NON è 'Piemonte' e ordina per provincia, città, cognome e nome
*/
select cognome, nome, indirizzo, citta, provincia, email, data_nascita
from studenti
where regione != 'Piemonte'
order by provincia, citta, cognome, nome;
/*
5
seleziona il cognome, il nome, il genere, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è maggiore della data '1995-01-01' compresa
e ordina per data di nascita dalla più recente alla più remota e per genere
*/
select cognome, nome, genere, email, data_nascita
from studenti
where data_nascita >= '1995-01-01'
order by data_nascita desc, genere;
/*
6
seleziona il cognome, il nome, l'email, la provincia e la data di nascita
dalla tabella studenti
il cui genere è 'femmina' e la provincia è diversa da 'Torino' e ordina per cognome e nome
*/
select cognome, nome, email, provincia, data_nascita
from studenti
where genere = 'f' and provincia != 'TO'
order by cognome, nome;
/*
7
seleziona il cognome, il nome, l'email, la citta, la provincia e la data di nascita, 
dalla tabella studenti
la cui provincia è Cuneo o Alessandria e ordina per provincia, cognome e nome
*/
select cognome, nome, email, citta, provincia, data_nascita
from studenti
where provincia = 'CN' or provincia = 'AL'
order by provincia, cognome, nome;
/*
8
seleziona il cognome, il nome, l'email, la data di nascita e la provincia
dalla tabella studenti
la cui provincia è Cuneo o Asti o Novara o Alessandria e ordina per provincia, cognome e nome
usate l'operatore IN
*/
select cognome, nome, email, data_nascita, provincia
from studenti
where provincia in('cn', 'at', 'no', 'al')
order by provincia, cognome, nome;
/*
9
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è compresa tra il 1980-01-01 e il 1989-12-31
e il cui genere è 'maschio' e ordina per data di nascita dalla più recente alla più remota,
per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where data_nascita between '1980-01-01' and '1989-12-31' and genere = 'm'
order by data_nascita desc, cognome, nome;
/*
10
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita NON è compresa tra il 1990-01-01 e il 1994-12-31
e il cui genere è 'femmina' e ordina per data di nascita dalla più recente alla più remota,
per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where data_nascita not between '1990-01-01' and '1994-12-31' and genere = 'f'
order by data_nascita desc, cognome, nome;
/*
11
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome inizia per 'b' e ordina per cognome e nome
*/
select cognome, nome, email, data_nascita
from studenti
where cognome like 'b%'
order by cognome, nome;
/*
12
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome inizia per 'ba' o 'ga' e ordina per cognome e nome
usate regexp
*/
select cognome, nome, email, data_nascita
from studenti
where cognome regexp '^ba|ga'
order by cognome, nome;
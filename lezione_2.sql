select cognome, nome, email
from studenti;

select * from studenti
where genere = 'f';

select cognome, nome, email
from studenti
where genere = 'f';

select * from studenti
order by cognome;

select * from studenti
order by cognome DESC;

select * from studenti
order by cognome, nome;

select * from studenti
order by cognome, nome, data_nascita;

select * from studenti
order by cognome
limit 0, 10;

select * from studenti
order by cognome
limit 10, 10;

select * from studenti
where genere != 'f';

select * from studenti
where citta <> 'torino'
order by citta;

select * from studenti
where data_nascita <= '1990-01-01'
order by data_nascita;

select * from studenti
where data_nascita <= '1990-01-01' and genere = 'f' and citta = 'torino'
order by data_nascita;

select * from studenti
where data_nascita <= '1990-01-01' or genere = 'f'
order by data_nascita;

select * from studenti
where provincia = 'MI' or genere = 'f'
order by data_nascita;

select * from studenti
where provincia = 'mi' or provincia = 'bg' or provincia = 'at'
order by provincia;

select * from studenti
where  cognome = 'rossi' and provincia = 'to' or cognome = 'verdi'
order by cognome;

select * from studenti
where provincia = 'at' 
or provincia = 'al' 
or provincia = 'cn'
or provincia = 'no'
order by provincia;

select * from studenti
where provincia not in('at','al','cn','no')
order by provincia;

select * from studenti
where data_nascita not between '1990-01-01' and '1999-12-31'
order by data_nascita;

update studenti
set genere = 'f'
where provincia = 'mi';

select cognome, provincia, genere from studenti
where genere is null;

select * from studenti
where cognome like '%a'
order by cognome;

select * from studenti
where email like '%gmail.com'
order by email;

select * from studenti
where nome like 'paol_';

select * from studenti 
where indirizzo like 'via %';

select * from studenti
where nome regexp '^mar';

select * from studenti
where nome regexp 'co$';

select * from studenti
where nome regexp '^(mar|ara)|co$';

select * from studenti
where nome regexp '^[a-m]'
order by nome;

select * from studenti;
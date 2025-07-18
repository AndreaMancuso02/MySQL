desc impiegati;
show create table impiegati;

select count(*) from impiegati;

explain analyze
select nome, cognome, genere, data_nascita
from impiegati
where provincia = 'to';

alter table impiegati add index k_prov(provincia);
analyze table impiegati;

explain
select nome, cognome, genere, data_nascita
from impiegati
where data_nascita between '1980-01-01' and '1980-12-31';

alter table impiegati add index k_data_nascita(data_nascita);

alter table impiegati add index k_year(only_year);

explain
select nome, cognome, genere, data_nascita
from impiegati 
where only_year = '1980';

show index from impiegati;

alter table impiegati drop index k_year;

explain
select nome, cognome, genere, stipendio
from impiegati
where provincia = 'to'
and stipendio > (select avg(stipendio) from impiegati)
order by stipendio desc;

alter table impiegati add index k_prov_stip_DESC(provincia, stipendio desc);
analyze table impiegati;




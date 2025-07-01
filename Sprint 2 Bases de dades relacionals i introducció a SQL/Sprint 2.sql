-- Nivel 1 
-- Exercici 2 --
-- Llistat dels països que estan generant vendes.
select company.country as country_name, count(transaction.id) as total_transactions
from company
join transaction
on company.id = transaction.company_id
where declined = 0
group by country_name
order by total_transactions desc;

-- Des de quants països es generen les vendes.
select count(distinct(company.country)) as total_country_trans
from company
left join transaction
on company.id = transaction.company_id
where declined = 0;

-- Identifica la companyia amb la mitjana més gran de vendes.
select transaction.company_id, company.company_name, round(avg(transaction.amount),2)as media_sales
from transaction
join company
on transaction.company_id = company.id
where declined=0  -- considerar el declined para obtener una media de ventas más exacta
group by transaction.company_id, company.company_name
order by media_sales DESC
limit 1;

-- Exercici 3 -- -- Utilitzant només subconsultes (sense utilitzar JOIN): 
-- Mostra totes les transaccions realitzades per empreses d'Alemanya.
select * from transaction
where company_id in
(select id from company
where country = 'Germany'
group by id);


-- Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.
select  company_id from transaction
where amount >
(select round(avg(amount)) 
from transaction)
group by company_id;


-- Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.
select id, company_name 
from company
where id not in
(select distinct company_id from transaction) 
group by id, company_name;




-- Nivell 2 -- Exercici 1 --
-- Identifica els cinc dies que es va generar la quantitat més gran d'ingressos a l'empresa per vendes. 
-- Mostra la data de cada transacció juntament amb el total de les vendes.

select date(timestamp), sum(amount) as total_sales
from transaction
group by date(timestamp)
order by total_sales desc
limit 5;

-- Exercici 2 --
-- Quina és la mitjana de vendes per país? Presenta els resultats ordenats de major a menor mitjà.
select company.country, round(avg(amount)) as media_country_sales
from company
join transaction
on company.id = transaction.company_id
group by company.country
order by media_country_sales desc;


-- Exercici 3 --
-- En la teva empresa, es planteja un nou projecte per a llançar algunes campanyes publicitàries per a fer competència a la companyia "Non Institute". 
-- Per a això, et demanen la llista de totes les transaccions realitzades per empreses que estan situades en el mateix país que aquesta companyia.
-- Mostra el llistat aplicant JOIN i subconsultes.

select * from transaction -- join w/subquery
join company
on transaction.company_id = company.id
where company.country in (select country from company
where company_name = 'Non Institute');


-- Mostra el llistat aplicant solament subconsultes.
select * from transaction
where company_id in
(select id 
from company
           where country = (select country from company
           where company_name = 'Non Institute'));


-- Nivell 3
-- Exercici 1 --
-- Presenta el nom, telèfon, país, data i amount, d'aquelles empreses que van realitzar transaccions amb un valor 
-- comprès entre 350 i 400 euros i en alguna d'aquestes dates: 29 d'abril del 2015, 20 de juliol del 2018 i 13 de març del 2024. 
-- Ordena els resultats de major a menor quantitat.
select company.id, company.company_name, company.phone, company.country, transaction.amount, transaction.timestamp
from company
join transaction
on company.id = transaction.company_id
where transaction.amount between 350 and 400 and transaction.declined=0 and date(transaction.timestamp) in ('2015-04-29', '2018-07-20', '2024-03-13')
order by transaction.amount desc;

-- Exercici 2 --
-- Necessitem optimitzar l'assignació dels recursos i dependrà de la capacitat operativa que es requereixi, 
-- per la qual cosa et demanen la informació sobre la quantitat de transaccions que realitzen les empreses, 
-- però el departament de recursos humans és exigent i vol un llistat de les empreses on especifiquis si tenen més de 400 transaccions o menys.

select company_id, (select company_name
			from company
            where company.id = transaction.company_id) as c_name, 
	case when count(id) > 400 then "MAS DE 400" else "MENOS DE 400" end as cantidad_de_operaciones
from transaction
group by company_id;




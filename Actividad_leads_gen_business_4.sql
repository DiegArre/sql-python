USE lead_gen_business;
/*1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?*/

SELECT MONTHNAME(charged_datetime) as month, SUM(amount) FROM billing 
WHERE  billing.charged_datetime >= '2012/03/01' 
AND billing.charged_datetime <= '2012/03/31'; 


/*2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?*/

SELECT client_id, SUM(amount) as ingreso_total FROM billing 
WHERE  client_id = 2;

/*3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?*/

SELECT * FROM clients
JOIN sites ON sites.client_id = clients.client_id
WHERE sites.client_id = 10;

/*4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por
 año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20?*/
 
SELECT clients.client_id, CONCAT(first_name ," ", last_name) as nombre, MONTHNAME(created_datetime) as mes_creado, YEAR(created_datetime) as año_creado FROM clients
JOIN sites ON sites.client_id = clients.client_id
WHERE sites.client_id = 1 OR sites.client_id = 20
ORDER BY año_creado;

/*5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales 
generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?*/

SELECT domain_name,registered_datetime, CONCAT(first_name ," ", last_name) as nombre FROM leads
JOIN sites ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= "2011/01/01" AND leads.registered_datetime <= "2011/02/15";

/* 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número
 total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre
 el 1 de enero de 2011 y el 31 de diciembre de 2011?*/
 
SELECT clients.client_id, CONCAT(clients.first_name ," ", clients.last_name) as nombre_cliente, COUNT(leads.leads_id) as num_leads 
FROM clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime >= "2011/01/01" AND leads.registered_datetime <= "2011/12/31"
GROUP BY client_id;

/*7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número
 total de clientes potenciales que hemos generado para cada cliente cada mes entre los
 meses 1 y 6 del año 2011? */
 
SELECT clients.client_id, CONCAT(clients.first_name ," ", clients.last_name) as nombre_cliente, 
COUNT(leads.leads_id) as num_leads, MONTHNAME(leads.registered_datetime) as month
FROM clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime >= "2011/01/01" AND leads.registered_datetime <= "2011/12/31"
GROUP BY nombre_cliente, month
ORDER BY leads.registered_datetime; 

/*8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número
 total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros
 clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta
 por ID de cliente. Presente una segunda consulta que muestre todos los clientes, los nombres
 del sitio y el número total de clientes potenciales generados en cada sitio en todo momento.*/

SELECT clients.client_id, CONCAT(clients.first_name ," ", clients.last_name) as nombre_cliente,
 sites.domain_name, COUNT(sites.domain_name) as num_leads
FROM clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime >= "2011/01/01" AND leads.registered_datetime <= "2011/12/31"
GROUP BY domain_name 
ORDER BY clients.client_id;

SELECT clients.client_id, CONCAT(clients.first_name ," ", clients.last_name) as nombre_cliente,
 sites.domain_name, COUNT(sites.domain_name) as num_leads
FROM clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
GROUP BY domain_name 
ORDER BY clients.client_id;

/*9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente 
para cada mes del año. Pídalo por ID de cliente.*/

SELECT client_id,SUM(amount), DATE_FORMAT(charged_datetime, "%M , %Y") as date_time FROM billing 
GROUP BY client_id, date_time
ORDER BY client_id, charged_datetime;

/*10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente.
 Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo
 campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)*/
 
SELECT clients.client_id, CONCAT(first_name ," ", last_name) as nombre, 
GROUP_CONCAT(DISTINCT sites.domain_name ORDER BY sites.domain_name separator " / " ) as Sitios FROM clients
JOIN sites ON sites.client_id = clients.client_id
GROUP BY clients.client_id

 
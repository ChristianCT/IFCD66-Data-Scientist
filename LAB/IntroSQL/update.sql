-- Actualizar el nombre de la tienda de Paige Turner de 'Mimia' a 'Miami'
UPDATE salespersons
SET store_name = 'Miami'
WHERE first_name = 'Paige' AND last_name = 'Turner';

-- Actualizar las direcciones de correo electrónico de los clientes
UPDATE customers
SET email = 'ppicasso@gmail.com'
WHERE first_name = 'Pablo' AND last_name = 'Picasso';

UPDATE customers
SET email = 'lincoln@us.gov'
WHERE first_name = 'Abraham' AND last_name = 'Lincoln';

UPDATE customers
SET email = 'hello@napoleon.me'
WHERE first_name = 'Napoléon' AND last_name = 'Bonaparte';
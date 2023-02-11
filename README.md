clonar el repositorio
requisito PHP8 y mysql 
composer update //para actualizar el repositorio
configurar la base de datos ruta assets/db/web_factura.sql 
revisar la conexion en el .env //en mi caso el puerto de mysql era 33060
php bin/console cache:clear

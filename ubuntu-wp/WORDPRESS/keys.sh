#!/bin/bash

config_wordpress="/srv/www/wordpress/wp-config.php" 
keys_file="claves.txt"

cd /vagrant/WORDPRESS/

rm -f index*
wget https://api.wordpress.org/secret-key/1.1/salt/
cat index.html > $keys_file

if [ $? -ne 0  ]; then
	#statements
	echo "El comando falló, comprueba internet y el comando wget"
	exit 1

else
	echo "Fichero descargado."
fi

# Reemplaza las líneas entre las claves con las nuevas

if [ -f $config_wordpress ]; then
	#statements
	echo "Fichero de configuración de wordpress encontrado."
else
	echo "Fichero no encontrado en la ruta $config_wordpress"
	exit 2
fi

linea_claves=$(grep -n "'AUTH_KEY'" /srv/www/wordpress/wp-config.php | cut -d: -f1 | head -n1)

echo "LA LINEA ES: $linea_claves"

sed -i '/AUTH_KEY/,/NONCE_SALT/d' "$config_wordpress"  # Borra todas las líneas entre AUTH_KEY y NONCE_SALT
sed -i "${linea_claves}r $keys_file" "$config_wordpress"  # Inserta el contenido del archivo con claves

#cat $keys_file >> $config_wordpress

if [ $? -eq 0 ] ; then
	echo "No ha habido ningún problema importando clave."
else
	echo "No se ha podido importar las claves."
	exit 3
fi
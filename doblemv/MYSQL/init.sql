/*INIT PARA WORDPRESS*/

CREATE DATABASE wordpress;

CREATE USER wordpress@'%'  IDENTIFIED BY 'passtest';

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@'%';

FLUSH PRIVILEGES;

quit


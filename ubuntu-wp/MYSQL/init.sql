/*INIT PARA WORDPRESS*/

CREATE DATABASE wordpress;

CREATE USER wordpress@localhost IDENTIFIED BY 'passtest';

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;

FLUSH PRIVILEGES;

quit


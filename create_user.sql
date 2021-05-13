CREATE USER 'homestead'@'%' IDENTIFIED WITH mysql_native_password BY  'sePret^i';
GRANT ALL PRIVILEGES ON * . * TO 'david'@'%';
CREATE DATABASE homestead;
use homestead;
FLUSH PRIVILEGES;
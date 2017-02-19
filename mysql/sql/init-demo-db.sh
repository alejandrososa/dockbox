#!/bin/bash
set -e
mysql -u root -p"$MYSQL_ROOT_PASSWORD" << EOF
    DROP USER IF EXISTS user_demo;
    CREATE USER 'user_demo'@'%';
    CREATE DATABASE IF NOT EXISTS demo_inicial;
    GRANT ALL ON demo_inicial.* TO 'user_demo'@'%' IDENTIFIED BY '123456';
EOF
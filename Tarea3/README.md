# Instrucciones
Primero busque las imagenes y documentacion en dockerhub, despues para cada imagen busque una version que me llamara la atencion y nada mas lei la documentacion lo que pide cada imagen para poder funcionar, de todas las imagenes, el de oracle es la mas extraña que encontre en su documentacion, las demas son casi iguales.


# ------------------------------ MYSQL -------------------------------------------
FROM mysql:8.0.33 AS MySQL8

ENV MYSQL_ROOT_PASSWORD=C0ntrol1* 

EXPOSE 3306

# ------------------------------ POSTGRES ----------------------------------------
FROM postgres:latest AS Postgres

ENV POSTGRES_PASSWORD=C0ntrol1*

EXPOSE 5432

# ------------------------------ ORACLE ------------------------------------------

FROM gvenzl/oracle-xe:21 AS Oracle

ENV ORACLE_PASSWORD=C0ntrol1*

EXPOSE 1521

  mysql:
    container_name: MySQL8
    build:
      context: .
      target: MySQL8
    ports:
      - 20001:3306
    volumes:
      - ./file_db/Mysql/:/var/lib/mysql
    restart: always

  postgres:
    container_name: Postgres
    build:
      context: .
      target: Postgres
      ports:
      - 20003:5432
      volumes:
      - ./file_db/Postgres:/var/lib/postgresql/data
      restart: always

  oracle:
    container_name: Oracle
    build:
      context: .
      target: Oracle
      ports:
      - 19999:1521
      volumes:
      - ./file_db/Oracle:/u01/app/oracle/oradata
    restart: always

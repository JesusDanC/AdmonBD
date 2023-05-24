# ------------------------------ SQL 2019 ---------------------------------------
FROM mcr.microsoft.com/mssql/server:2019-CU18-ubuntu-20.04 AS SQL2019

ENV MSSQL_SA_PASSWORD=C0ntrol1* ACCEPT_EULA=Y MSSQL_PID=Developer 

EXPOSE 1433

# ------------------------------ MYSQL -------------------------------------------
FROM mysql:8.0.33 AS MySQL8

ENV MYSQL_ROOT_PASSWORD=C0ntrol1* 

EXPOSE 3306





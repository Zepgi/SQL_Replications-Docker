# Usa la imagen de SQL Server 2022
FROM mcr.microsoft.com/mssql/server:2022-latest

# Establece variables de entorno
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Admin1234*

# Expone el puerto 1433 para SQL Server
EXPOSE 1539

# Archivo de restauración de una base de datos.
COPY AdventureWorks2022.bak /var/opt/mssql/data

# Ejecuta comandos de configuración al iniciar el contenedor
RUN /opt/mssql/bin/mssql-conf set sqlagent.enabled true && \
    mkdir -p /var/opt/mssql/ReplData && \
    chmod -R 777 /var/opt/mssql/ReplData

# Comando para iniciar SQL Server
CMD ["/opt/mssql/bin/sqlservr"]

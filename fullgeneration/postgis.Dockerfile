FROM postgis/postgis:12-3.0-alpine

COPY data/limadm.sql /docker-entrypoint-initdb.d/limadm.sql
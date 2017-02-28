#pg-microuser
Creates PostgresSQL roles and schemas for microservices

## Usage
```
# Create read only and read/write admin roles which will have access to microservice schemas
docker run -it -e PGHOST=myhost -e PGDATABASE=mydb -e PGUSER=superuser -e PGPASSWORD=supersecret quay.io/guidesmiths/pg-microuser create-role gs_admin_ro reallysecret
docker run -it -e PGHOST=myhost -e PGDATABASE=mydb -e PGUSER=superuser -e PGPASSWORD=supersecret quay.io/guidesmiths/pg-microuser create-role gs_admin_rw reallyreallysecret

# Create a role and schema for microservice 1, granting approriate access to the read only and read/write admin roles
docker run -it -e PGHOST=myhost -e PGDATABASE=mydb -e PGUSER=superuser -e PGPASSWORD=supersecret quay.io/guidesmiths/pg-microuser create-role gs_svc_1 secret1
docker run -it -e PGHOST=myhost -e PGDATABASE=mydb -e PGUSER=superuser -e PGPASSWORD=supersecret quay.io/guidesmiths/pg-microuser create-schema gs_svc_1 gs_admin_ro gs_admin_rw

# Create a role and schema for microservice 2, granting approriate access to the read only and read/write admin roles
docker run -it -e PGHOST=myhost -e PGDATABASE=mydb -e PGUSER=superuser -e PGPASSWORD=supersecret quay.io/guidesmiths/pg-microuser create-role gs_svc_2 secret2
docker run -it -e PGHOST=myhost -e PGDATABASE=mydb -e PGUSER=superuser -e PGPASSWORD=supersecret quay.io/guidesmiths/pg-microuser create-schema gs_svc_2 gs_admin_ro gs_admin_rw
```
# pg-microuser

#pg-microuser
Creates PostgresSQL roles and schemas for microservices

## Create Role
```
# Create gs_admin_ro role which will have read only access to all microservice schemas
docker run -it \
           -e PGHOST=myhost \
           -e PGDATABASE=mydb \
           -e PGUSER=superuser \
           -e PGPASSWORD=supersecret \
           quay.io/guidesmiths/pg-microuser create-role gs_admin_ro reallysecret

# Create gs_admin_rw role which will have full access to all microservice schemas
docker run -it \
           -e PGHOST=myhost \
           -e PGDATABASE=mydb \
           -e PGUSER=superuser \
           -e PGPASSWORD=supersecret \
           quay.io/guidesmiths/pg-microuser create-role gs_admin_rw reallyreallysecret


# Create gs_svc_1 role which will have full access to a single schema
docker run -it \
           -e PGHOST=myhost \
           -e PGDATABASE=mydb \
           -e PGUSER=superuser \
           -e PGPASSWORD=supersecret \
           quay.io/guidesmiths/pg-microuser create-role gs_svc_1 secret1
```

## Create Schema
```
# Create a schema for gs_svc_1 role and grant appropriate access to the gs_admin_ro and gs_admin_rw
docker run -it
           -e PGHOST=myhost \
           -e PGDATABASE=mydb \
           -e PGUSER=superuser \
           -e PGPASSWORD=supersecret \
           quay.io/guidesmiths/pg-microuser create-schema gs_svc_1 gs_admin_ro gs_admin_rw
```

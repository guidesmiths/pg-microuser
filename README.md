#pg-microuser
Creates PostgresSQL roles and schemas for microservices

## Create Role
```
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
# Create a schema for gs_svc_1 role 
docker run -it
           -e PGHOST=myhost \
           -e PGDATABASE=mydb \
           -e PGUSER=superuser \
           -e PGPASSWORD=supersecret \
           quay.io/guidesmiths/pg-microuser create-schema gs_svc_1 
```

## Create Both
Wrapper for create-role and create-schema
```
docker run -it
           -e PGHOST=myhost \
           -e PGDATABASE=mydb \
           -e PGUSER=superuser \
           -e PGPASSWORD=supersecret \
           quay.io/guidesmiths/pg-microuser create-both gs_svc_1 secret1 
```

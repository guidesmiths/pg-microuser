FROM postgres:alpine

ADD create-role.sql .
ADD create-schema.sql .
ADD run.sh .

ENTRYPOINT ["./run.sh"]

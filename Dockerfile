FROM postgres

ADD create-role.sql .
ADD create-schema.sql .
ADD run.sh .

ENTRYPOINT ["./run.sh"]

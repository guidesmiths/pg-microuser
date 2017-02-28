DO
$body$
BEGIN
   IF NOT EXISTS (
      SELECT 1
      FROM   pg_catalog.pg_user
      WHERE  usename = '__USER__') THEN

      CREATE ROLE __USER__ LOGIN PASSWORD '__PASSWORD__';
   END IF;
END
$body$;

#!/bin/bash

if [ -z "$PGHOST" ] && [ -z "$PGHOSTADDR" ]; then
    echo "PGHOST or PGHOSTADDR environment variable not set"
    exit 1
fi

if [ -z "$PGDATABASE" ]; then
    echo "PGDATABASE environment variable not set"
    exit 1
fi

if [ -z "$PGUSER" ]; then
    echo "PGUSER environment variable not set"
    exit 1
fi

if [ -z "$PGPASSWORD" ] && [ -z "$PGPASSFILE" ]; then
    echo "PGPASSWORD or PGPASSFILE environent variable not set"
    exit 1
fi

if [ "$1" == "create-role" ]; then

    USER=$2
    PASS=$3

    if [ -z "$USER" ] || [ -z "$PASS" ]; then
        echo "Usage: run.sh create-role <username> <password>"
        exit 1
    fi

    SQL=$(sed "s/__USER__/$2/g" create-role.sql | sed "s/__PASSWORD__/$3/g")
    psql << EOF
    $SQL
EOF
    exit 0
fi

if [ "$1" == "create-schema" ]; then

    OWNER=$2
    READ_ONLY_USER=$3
    ADMIN_USER=$4

    if [ -z "$OWNER" ] || [ -z "$READ_ONLY_USER" ] || [ -z "$ADMIN_USER" ]; then
        echo "Usage: run.sh create-schema <owner> <read only user> <admin user>"
        exit 1
    fi

    SQL=$(sed "s/__OWNER__/$OWNER/g" create-schema.sql | sed "s/__READ_ONLY_USER__/$READ_ONLY_USER/g" | sed "s/__ADMIN_USER__/$ADMIN_USER/g")
    echo $SQL
    psql << EOF
    $SQL
EOF
    exit 0
fi

echo "Unknown command: $1"
exit 1

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

    if [ -z "$USER" ]; then
        USER=$2
    fi
    if [ -z "$PASSWORD" ]; then
        PASSWORD=$3
    fi

    if [ -z "$USER" ] || [ -z "$PASSWORD" ]; then
        echo "Usage: run.sh create-role <username> <password>"
        exit 1
    fi

    SQL=$(sed "s/__USER__/$USER/g" create-role.sql | sed "s/__PASSWORD__/$PASSWORD/g")
    psql << EOF
    $SQL
EOF
    exit 0
fi

if [ "$1" == "create-schema" ]; then

    if [ -z "$OWNER" ]; then
        OWNER=$2
    fi
    if [ -z "$READ_ONLY_USER" ]; then
        READ_ONLY_USER=$3
    fi
    if [ -z "$ADMIN_USER" ]; then
        ADMIN_USER=$4
    fi

    if [ -z "$OWNER" ] || [ -z "$READ_ONLY_USER" ] || [ -z "$ADMIN_USER" ]; then
        echo "Usage: run.sh create-schema <owner> <read only user> <admin user>"
        exit 1
    fi

    SQL=$(sed "s/__PGUSER__/$PGUSER/g" create-schema.sql | sed "s/__OWNER__/$OWNER/g" | sed "s/__READ_ONLY_USER__/$READ_ONLY_USER/g" | sed "s/__ADMIN_USER__/$ADMIN_USER/g")
    echo $SQL
    psql << EOF
    $SQL
EOF
    exit 0
fi

echo "Unknown command: $1"
exit 1

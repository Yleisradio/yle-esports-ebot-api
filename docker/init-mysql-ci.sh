#!/bin/bash
set -o errexit

main () {

    echo "Waiting for database to start."

    sleep 15

    echo "Running schema"

    mysql  -uroot -p"$MYSQL_ROOT_PASSWORD" ebotv3 < /data/sql/ebotv3.sql


    echo ""
}

main "$@"

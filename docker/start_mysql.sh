#!/bin/bash
set -o errexit

main () {

    script_path=$(pwd)/:/data/
    docker run -d --name esports-mysql  -v $script_path -p 44090:3306  -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=ebotv3 -e MYSQL_USER=ebotclient -e MYSQL_PASSWORD=ebotclient mysql:latest

    docker exec -it esports-mysql /data/init-mysql-ci.sh

}

main "$@"

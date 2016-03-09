#!/bin/bash
java -server -Xms256m -Xmx1024m -Denvironment=$ENVIRONMENT -Dpackage.version=$PACKAGE_VERSION -Djava.io.tmpdir=/var/tmp -Dfile.encoding=UTF-8 -jar /opt/esports-api/esports-ebot-api-v1.jar
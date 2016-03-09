# eBot-api
Rest api for eBot-CSGO database.

Rest api is read only and a subset of data from eBot database, meant for external partners to use
match data during or after tournaments.

Highly recommended to use read slave(mysql) for the api.
We used Amazon RDS, [read more how to set up RDS slave with onsite cluster](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.External.Repl.html)

Read more about eBot here https://github.com/deStrO/eBot-CSGO.
* [eSport-tools.net website](http://www.esport-tools.net/)

## Usage

### Run the application locally

Start mysql as docker container first

`cd docker && ./start_mysql.sh`

Start application in dev env:

`lein ring server`

### Run the tests

`lein test`

### Packaging and running as standalone jar for production

```
lein clean, ring uberjar
java -jar target/server.jar
```

### Packaging as war

`lein ring uberwar`

## License

Copyright ©  Yleisradio


The MIT License (MIT)

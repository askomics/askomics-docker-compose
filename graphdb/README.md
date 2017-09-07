# AskOmics + graphDB

This docker-compose deploy the following dockers:

- askomics/docker-askomics
- ontotext/graphdb
- nginx
- catatnight/postfix

## Configuration

### GraphDB

docker run -p 127.0.0.1:7200:7200 --name graphdb -t ontotext/graphdb:tag

### Postfix

You can update the smpt username and password. Don't forget to also update the smtp user in the AskOmics environments variables.


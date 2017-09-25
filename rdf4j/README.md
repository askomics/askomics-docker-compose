# AskOmics + graphDB

This docker-compose deploy the following dockers:

- askomics/askomics
- yyz1989/rdf4j
- nginx
- catatnight/postfix

## Configuration

### RDF4J

docker run -d --rm -p 8080:8080 -e RDF4J_DATA=/data -v /opt/rdf4j-data:/data -e JVM_PARAMS="-Xms1g -Xmx8g" yyz1989/rdf4j

### Postfix

You can update the smpt username and password. Don't forget to also update the smtp user in the AskOmics environments variables.


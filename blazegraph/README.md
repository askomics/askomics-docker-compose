# AskOmics + Blazegraph

This docker-compose deploy the following dockers:

- askomics/askomics
- lyrasis/blazegraph:2.1.4
- nginx
- catatnight/postfix

## Configuration

### Blazegraph

docker run --name blazegraph -d -p 8889:8080 lyrasis/blazegraph:2.1.4

### Postfix

You can update the smpt username and password. Don't forget to also update the smtp user in the AskOmics environments variables.


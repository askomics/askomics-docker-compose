# AskOmics + Allegrograph

This docker-compose deploy the following dockers:

- askomics/askomics
- franzinc/agraph
- nginx
- catatnight/postfix

## Configuration

### Agraph

You have to create a new repository first.

Got to [http://localhost:10035](http://localhost:10035) and create a nex repository named `database`

The licence limite to 5000000 the number of triples


### Postfix

You can update the smpt username and password. Don't forget to also update the smtp user in the AskOmics environments variables.

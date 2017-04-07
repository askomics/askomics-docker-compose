# askomics-docker-compose
Deployment of AskOmics with differents triplestore :

Actual compatibility with Askomics 

| TPS            |  Status |
|----------------|---------|
|Virtuoso        |  OK     |
|Fuseki          |  KO     |
|AllegroGraph    | not yet implemented |
|Corese          | not yet implemented |


## Virtuoso

check [tenforce/virtuoso](https://hub.docker.com/r/tenforce/virtuoso/) doc to configure virtuoso execution

### Configuration

Update the `VIRT_Parameters_NumberOfBuffers` and `VIRT_Parameters_MaxDirtyBuffers` environments according to how much memory do you want to allow to Virtuoso:

| Memory available (GB) | NumberOfBuffers | MaxDirtyBuffers |
|-----------------------|-----------------|-----------------|
| 2                     | 170000          | 130000          |
| 4                     | 340000          | 250000          |
| 6                     | 510000          | 375000          |
| 8                     | 680000          | 500000          |
| 16                    | 1360000         | 1000000         |
| 32                    | 2720000         | 2000000         |
| 48                    | 4000000         | 3000000         |
| 64                    | 5450000         | 4000000         |

### Clean 

docker exec -it virtuoso_virtuoso_1  /usr/local/virtuoso-opensource/bin/isql-v 1111 dba dba

SQL>RDF_GLOBAL_RESET ();

### Fuseki

The deployment is Ok but SPARQL AskOmics get Error

### AllegroGraph

not yet implemented

### Corese

not yet implemented


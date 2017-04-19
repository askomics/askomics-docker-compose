# AskOmics + Galaxy + Virtuoso

This docker-compose deploy the following dockers:

- askomics/docker-askomics
- tenforce/virtuoso
- nginx
- catatnight/postfix
- galaxy-askomics

## Configuration

### Galaxy

docker galaxy-askomics is not yet available on dockerhub, so you have to build it first.

    git clone https://github.com/askomics/docker-galaxy-askomics.git
    cd docker-galaxy-askomics
    docker build -t galaxy-askomics .


### Virtuoso

check [tenforce/virtuoso](https://hub.docker.com/r/tenforce/virtuoso/) doc to configure virtuoso execution

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

### Postfix

You can update the smpt username and password. Don't forget to also update the smtp user in the AskOmics environments variables.


## Clean

    docker exec -it virtuoso_virtuoso_1  /usr/local/virtuoso-opensource/bin/isql-v 1111 dba dba
    SQL>RDF_GLOBAL_RESET ();

to clean the virtuoso database
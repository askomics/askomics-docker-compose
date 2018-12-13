# Docker compose Files

Some docker-compose file to deploy AskOmics with all its dependencies.

## Install docker and docker-compose

```bash
# docker
sudo curl -sSL https://get.docker.com/ | sh
# docker-compose
# Debian/ubuntu
sudo apt install -y docker-compose
# Fedora
sudo dnf install -y docker-compose
```
## [virtuoso](virtuoso)

- askomics/askomics
- askomics/virtuoso
- nginx

## [fuseki](fuseki)

- askomics/askomics
- xgaia/jena-fuseki:dev
- nginx

## [virtuoso-fedx](virtuoso-fedx)

- askomics/askomics
- askomics/virtuoso
- askomics/fedx4askomics:rdf4j
- nginx
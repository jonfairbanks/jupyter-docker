# Jupyter in Docker

[![Docker Release -- MAIN](https://github.com/jonfairbanks/jupyter-docker/actions/workflows/main.yaml/badge.svg?branch=main)](https://github.com/jonfairbanks/jupyter-docker/actions/workflows/main.yaml)
![Docker Pulls](https://img.shields.io/docker/pulls/jonfairbanks/jupyter-docker.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/jonfairbanks/jupyter-docker.svg)

- Included:
    - Nvidia Drivers

### Usage
```
docker run \
  -d \
  --name='Jupyter' \
  -e 'JUPYTER_ENABLE_LAB'='yes' \
  -e 'CHOWN_HOME'='yes' \
  -e 'CHOWN_HOME_OPTS'='-R' \
  -e 'NB_UID'='1000' \
  -e 'NB_GID'='1000' \
  -e 'GRANT_SUDO'='yes' \
  -p '8888:8888/tcp' \
  -v $PWD:'/home/jovyan':'rw' \
  --user root 'jonfairbanks/jupyter-docker' 
```

### Enabling GPU Support
Also pass `--gpus all` when starting the container

### Resources
- [Jupyter Docs](https://docs.jupyter.org/en/latest/)
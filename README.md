# jupyter-docker-template

Jupyter in Docker

- Bundled Kernels:
    - Python 3
    - Node.js
    - Golang


Start Up:
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
  -v '/mnt/user/appdata/Jupyter':'/home/jovyan':'rw' \
  --user root 'jonfairbanks/jupyter-docker' 
```
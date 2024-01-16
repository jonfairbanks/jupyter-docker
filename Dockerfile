FROM --platform=$BUILDPLATFORM quay.io/jupyter/scipy-notebook:2024-01-08

# Switch to root for installs and updates
# USER root

# Update apt-get and install Golang
# RUN apt-get update && apt-get install --no-install-recommends

# Switch back to the default notebook user
# USER $NB_UID

# Expose the notebook port
EXPOSE 8888
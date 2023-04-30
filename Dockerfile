FROM --platform=$BUILDPLATFORM jupyter/tensorflow-notebook:latest

# Switch to root for installs and updates
USER root

# Update apt-get and install Golang
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    golang && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install the Golang kernel and set it up
RUN go install github.com/gopherdata/gophernotes@v0.7.5 && \
    mkdir -p ~/.local/share/jupyter/kernels/gophernotes && \
    cd ~/.local/share/jupyter/kernels/gophernotes && \
    cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  "." && \
    chmod +w ./kernel.json && \
    sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json

# Install the Node.js kernel and set it up
RUN npm install -g ijavascript && ijsinstall --install=global

# Switch back to the default notebook user
USER $NB_UID

# Install Jupyter Notebook extensions
RUN conda install --quiet --yes 'jupyter_contrib_nbextensions==0.5.1' && \
    jupyter nbextensions_configurator enable --user && \
    jupyter nbextension enable --py widgetsnbextension

# Expose the notebook port
EXPOSE 8888
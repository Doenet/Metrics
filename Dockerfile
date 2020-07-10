FROM rpy2/base-ubuntu:latest

WORKDIR /app

COPY requirements.txt /app

RUN sudo ln -s /usr/bin/python3 /usr/bin/python && pip3 install -r /app/requirements.txt
# Binds command 'python' to 'python3' and install dependencies
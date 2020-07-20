# FROM r-base:latest
FROM rpy2/base-ubuntu:latest

COPY --from=r-base:latest /usr/bin/R /usr/bin/R

WORKDIR /app

COPY requirements.txt /app

# Binds command 'python' to 'python3' and install dependencies
RUN ln -s /usr/bin/python3 /usr/bin/python && pip3 install -r /app/requirements.txt

# RUN apt-get -y update
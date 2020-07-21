# FROM r-base:latest
FROM rpy2/base-ubuntu:latest

COPY --from=r-base:latest /usr/bin/R /usr/bin/R

WORKDIR /app

COPY requirements.txt /app

# Binds command 'python' to 'python3' and install dependencies
RUN ln -s /usr/bin/python3 /usr/bin/python && pip3 install -r /app/requirements.txt


RUN git clone https://github.com/cran/GPArotation.git
RUN R CMD INSTALL -l /usr/lib/R/site-library GPArotation
# permute for vegan
RUN git clone https://github.com/cran/permute.git
RUN R CMD INSTALL -l /usr/lib/R/site-library permute

RUN git clone https://github.com/cran/vegan.git
RUN R CMD INSTALL -l /usr/lib/R/site-library vegan

RUN git clone https://github.com/cran/Deriv.git
RUN R CMD INSTALL -l /usr/lib/R/site-library Deriv

#RcppArmadillo for dcurver and mirt
RUN git clone https://github.com/cran/RcppArmadillo.git
RUN R CMD INSTALL -l /usr/lib/R/site-library RcppArmadillo

RUN git clone https://github.com/cran/dcurver.git
RUN R CMD INSTALL -l /usr/lib/R/site-library dcurver

RUN git clone https://github.com/philchalmers/mirt
RUN R CMD INSTALL -l /usr/lib/R/site-library mirt



# * installing to library '/usr/local/lib/R/site-library'
# ERROR: dependencies 'GPArotation', 'vegan', 'Deriv', 'dcurver', 'RcppArmadillo' are not available for package 'mirt'
# * removing '/usr/local/lib/R/site-library/mirt'

# RUN apt-get -y update
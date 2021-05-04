FROM ubuntu:20.04

# environment variables that are useful
ENV TZ="America/Toronto"
ENV DEBIAN_FRONTEND="noninteractive"
ENV ASTROMETRY_VERSION="0.85"

# install dependencies
RUN apt-get update && apt-get upgrade -y --no-install-recommends && \
    apt-get install -y build-essential curl git file pkg-config swig \
       libcairo2-dev libnetpbm10-dev netpbm libpng-dev libjpeg-dev \
       zlib1g-dev libbz2-dev libcfitsio-dev wcslib-dev \
       python3 python3-pip python3-distutils python3-dev \
       python3-numpy python3-scipy python3-pil wget make tar

# Base astrometry.net installer
COPY ./scripts /scripts
WORKDIR /scripts
RUN ["./compile.sh"]

# cleanup
RUN ["/bin/bash", "-c", "rm -rf /scripts/astrometry.net-$ASTROMETRY_VERSION.tar.gz"]

# default command is to run the index file checker. If it does not 
CMD ["/usr/local/astrometry/bin/solve-field", "-h"]
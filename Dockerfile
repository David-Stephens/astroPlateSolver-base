FROM ubuntu:20.04

# environment variables that are useful
ENV TZ="America/Toronto"
ENV DEBIAN_FRONTEND="noninteractive"
ENV ASTROMETRY_VERSION="0.85"
ENV ASTROMETRY_DATADIR="/usr/local/astrometry/data"
ENV SCRIPT_DIR="/scripts"

# install dependencies
RUN apt-get update && apt-get upgrade -y --no-install-recommends && \
    apt-get install -y build-essential curl git file pkg-config swig \
       libcairo2-dev libnetpbm10-dev netpbm libpng-dev libjpeg-dev \
       zlib1g-dev libbz2-dev libcfitsio-dev wcslib-dev \
       python3 python3-pip python3-distutils python3-dev \
       python3-numpy python3-scipy python3-pil wget make tar && \
       apt-get clean && rm -rf /var/cache/apt/lists/*

# Base astrometry.net installer and other scripts
COPY ./scripts "${SCRIPT_DIR}"
RUN ["/bin/bash", "-c", "${SCRIPT_DIR}/compile.sh"]

# cleanup
RUN ["/bin/bash", "-c", "rm -rf /astrometry.net-$ASTROMETRY_VERSION.tar.gz"]
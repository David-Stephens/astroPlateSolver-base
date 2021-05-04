#!/usr/bin/env bash

set -e

# fetch astrometry.net. Default install instructions
wget http://astrometry.net/downloads/astrometry.net-$ASTROMETRY_VERSION.tar.gz && \
tar -xvzf astrometry.net-$ASTROMETRY_VERSION.tar.gz && \
cd astrometry.net-$ASTROMETRY_VERSION && \
make && \
make py && \
make extra && \
make install
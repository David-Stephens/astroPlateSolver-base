#!/usr/bin/env bash

set -e

wget -r -nd -np -nc -P "${ASTROMETRY_DATADIR}" -A "*.fits" "data.astrometry.net/4100/" && \
wget -r -nd -np -nc -P "${ASTROMETRY_DATADIR}" -A "*.fits" "data.astrometry.net/4200/"
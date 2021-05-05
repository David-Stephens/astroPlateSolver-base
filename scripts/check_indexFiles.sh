#!/usr/bin/env bash

set -e

# find fits files
numfiles="$(find $ASTROMETRY_DATADIR -type f -name '*.fits' | wc -l)"
minfiles=1
if [ "$numfiles" -lt "$minfiles" ]; then
    "${SCRIPT_DIR}/fetch_indexFiles.sh"
fi
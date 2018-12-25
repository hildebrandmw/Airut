#!/bin/bash

if [ $# == 0 ]; then
    echo "Install Julia"
    echo ""
    echo "./julia.sh <url> [dir=.]"
    echo ""
    echo "Consult https://julialang.org/downloads/ for the download url"
    exit 0
fi

# Download the julia tar
JULIA_URL=$1
wget $JULIA_URL

# Uncompress
JULIA_TARBALL=$(basename "$JULIA_URL")

# Get output directory if provided, otherwise default to .
if [ "$2" == "" ]; then
    OUTPUT_DIR=$PWD
else
    OUTPUT_DIR=$2
fi
echo $OUTPUT_DIR
tar -xzf $JULIA_TARBALL -C $OUTPUT_DIR

# Remove tarball
rm $JULIA_TARBALL

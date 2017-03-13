#!/bin/sh

if [ -z $1 ] || [ -z $2 ]; then
    echo "Usage: build.sh  VERSION  DISTRO"
    echo "                 ^        ^"
    echo "                 |0.10.1  |ubuntu/16.04"
    exit 1
fi

# Prepare output directory
out_dir=`date '+%Y-%m-%d-%H_%M_%S'`
volume=`pwd`/packages/$out_dir/$2
mkdir -p $volume

if [ $1 == 'master' ]; then
    prefix=""
else
    prefix="v"
fi

# Build the image
docker build --build-arg FLB_VERSION=$1 --build-arg FLB_PREFIX=$prefix -t flb-$1/$2 distros/$2

# Compile and package
docker run -e FLB_VERSION=$1 -v $volume:/output flb-$1/$2

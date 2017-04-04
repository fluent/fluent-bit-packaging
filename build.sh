#!/bin/sh

FLB_BRANCH=""
FLB_PREFIX=""
FLB_VERSION=""
FLB_DISTRO=""

if [ -z $1 ] || [ -z $2 ]; then
    echo "Usage: build.sh  VERSION  DISTRO"
    echo "                 ^        ^"
    echo "                 |0.10.1  |ubuntu/16.04"
    exit 1
fi

while getopts b: option
do
        case "${option}"
        in
                b) FLB_BRANCH=${OPTARG};;
        esac
done


if [ -z $FLB_BRANCH ]; then
    FLB_PREFIX="v"
    FLB_VERSION=$1
    FLB_DISTRO=$2
else
    FLB_VERSION=$FLB_BRANCH
    FLB_DISTRO=$3
fi


# Prepare output directory
out_dir=`date '+%Y-%m-%d-%H_%M_%S'`
volume=`pwd`/packages/$FLB_DISTRO/$FLB_VERSION/$out_dir/
mkdir -p $volume

# Info
echo "FLB_PREFIX  =>" $FLB_PREFIX
echo "FLB_VERSION =>" $FLB_VERSION
echo "FLB_DISTRO  =>" $FLB_DISTRO

if [ ! -z $(docker images -q flb-$FLB_VERSION-$FLB_DISTRO) ]; then
    echo "Deleting OLD image flb-$FLB_VERSION-$FLB_DISTRO"
    docker rmi -f flb-$FLB_VERSION-$FLB_DISTRO
fi

# Build the image
docker build \
       --build-arg FLB_VERSION=$FLB_VERSION \
       --build-arg FLB_PREFIX=$FLB_PREFIX \
       -t "flb-$FLB_VERSION-$FLB_DISTRO" "distros/$FLB_DISTRO"

# Compile and package
docker run -e FLB_VERSION=$FLB_VERSION -v $volume:/output "flb-$FLB_VERSION-$FLB_DISTRO"

echo
echo "Package(s) generated at: $volume"
echo

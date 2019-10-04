#!/bin/sh

FLB_BRANCH=""
FLB_PREFIX=""
FLB_VERSION=""
FLB_DISTRO=""

while getopts "v:d:b:t:" option
do
        case "${option}"
        in
            v) FLB_VERSION=${OPTARG};;
            d) FLB_DISTRO=${OPTARG};;
            b) FLB_BRANCH=${OPTARG};;
            t) FLB_TARGZ=${OPTARG};;
        esac
done

if [ -z $FLB_VERSION ] || [ -z $FLB_DISTRO ]; then
    echo "Usage: build.sh  -v VERSION  -d DISTRO"
    echo "                 ^               ^    "
    echo "                 | 1.3.0         | ubuntu/18.04"
    exit 1
fi

if [ -z $FLB_BRANCH ]; then
    FLB_PREFIX="v"
fi

# Validate 'Base Docker' image used to build the package
FLB_BASE=flb-build-base-$FLB_DISTRO

if [ -z $(docker images -q $FLB_BASE) ]; then
    # Base image not found, build it
    echo "Base Docker image $FLB_BASE not found"
    docker build --no-cache \
           -t "$FLB_BASE" \
           -f "$PWD/distros/$FLB_DISTRO/Dockerfile.base" \
           distros/$FLB_DISTRO/
else
    echo "Base Docker image $FLB_BASE found, using cached image"
fi

# Prepare output directory
out_dir=`date '+%Y-%m-%d-%H_%M_%S'`
volume=`pwd`/packages/$FLB_DISTRO/$FLB_VERSION/$out_dir/
sources=`pwd`/distros/$FLB_DISTRO/sources/
mkdir -p $volume

# Info
echo "FLB_PREFIX  =>" $FLB_PREFIX
echo "FLB_VERSION =>" $FLB_VERSION
echo "FLB_DISTRO  =>" $FLB_DISTRO
echo "FLB_SRC     =>" $FLB_TARGZ

if [ ! -z $(docker images -q flb-$FLB_VERSION-$FLB_DISTRO) ]; then
    echo "Deleting OLD image flb-$FLB_VERSION-$FLB_DISTRO"
    docker rmi -f flb-$FLB_VERSION-$FLB_DISTRO
fi

# Set tarball as an argument (./build.sh VERSION DISTRO/CODENAME -t something.tar.gz)
if [ ! -z "$FLB_TARGZ" ]; then
    # Create sources directory if it don't exists
    if [ ! -d "distros/$FLB_DISTRO/sources" ]; then
        mkdir "distros/$FLB_DISTRO/sources"
    fi

    # Set build argument and copy tarball
    FLB_ARG="--build-arg FLB_SRC=$FLB_TARGZ"
    cp $FLB_TARGZ "distros/$FLB_DISTRO/sources/"
fi

# Build the image
docker build \
       --no-cache \
       --build-arg FLB_VERSION=$FLB_VERSION \
       --build-arg FLB_PREFIX=$FLB_PREFIX \
       $FLB_ARG \
       -t "flb-$FLB_VERSION-$FLB_DISTRO" "distros/$FLB_DISTRO"

# Compile and package
docker run \
       -e FLB_PREFIX=$FLB_PREFIX \
       -e FLB_VERSION=$FLB_VERSION \
       -e FLB_SRC=$FLB_TARGZ \
       -v $volume:/output \
       "flb-$FLB_VERSION-$FLB_DISTRO"

# Delete temporal Build image
if [ ! -z $(docker images -q flb-$FLB_VERSION-$FLB_DISTRO) ]; then
    docker rmi -f flb-$FLB_VERSION-$FLB_DISTRO
fi

echo
echo "Package(s) generated at: $volume"
echo

if [ -z $1 ]; then
    echo "Usage: copy_tarball.sh  FILE"
    exit 1
fi


cp $1 ./distros/centos/8/sources/
cp $1 ./distros/centos/7.arm64v8/sources/
cp $1 ./distros/centos/7/sources/
cp $1 ./distros/centos/8.arm64v8/sources/
cp $1 ./distros/ubuntu/20.04/sources/
cp $1 ./distros/ubuntu/18.04/sources/
cp $1 ./distros/ubuntu/18.04/sources/
cp $1 ./distros/ubuntu/18.04/sources/
cp $1 ./distros/ubuntu/16.04/sources/
cp $1 ./distros/ubuntu/16.04/sources/
cp $1 ./distros/raspbian/buster/sources/
cp $1 ./distros/raspbian/jessie/sources/
cp $1 ./distros/raspbian/stretch/sources/
cp $1 ./distros/debian/buster/sources/
cp $1 ./distros/debian/buster/sources/
cp $1 ./distros/debian/buster.arm64v8/sources/
cp $1 ./distros/debian/jessie/sources/
cp $1 ./distros/debian/jessie.arm64v8/sources/
cp $1 ./distros/debian/stretch.arm64v8/sources/
cp $1 ./distros/debian/stretch/sources/
cp $1 ./distros/debian/stretch/sources/
cp $1 ./distros/amazonlinux/2/sources/
cp $1 ./distros/amazonlinux/2.arm64v8/sources/

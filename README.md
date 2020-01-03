# Fluent Bit Packaging

This repository contains Docker files used to build [Fluent Bit](http://fluentbit.io) Linux packages for different distros, the following table describe the supported targets:

| Distro       |   Version / Code Name   | Arch   | Target Option           |
|--------------|-------------------------|--------|-------------------------|
| AmazonLinux  |   1                     | amd64  | amazonlinux/1           |
| CentOS       |   7                     | amd64  | centos/7                |
| Debian       |   8                     | amd64  | debian/jessie           |
| Debian       |   9                     | amd64  | debian/stretch          |
| Debian       |   10                    | amd64  | debian/buster           |
| Ubuntu       |   16.04 / Xenial Xerus  | amd64  | ubuntu/16.04            |
| Ubuntu       |   18.04 / Bionic Beaver | amd64  | ubuntu/18.04            |
| Raspbian     |   8 / Jessie            | armhf  | raspbian/jessie         |
| Raspbian     |   9 / Stretch           | armhf  | raspbian/stretch        |
| openSUSE     |   15 / Leap             | amd64  | opensuse/leap           |

## Usage

The _build.sh_ script can be used to build packages for a specific target, the command understand the following format:

```
$ ./build.sh -v VERSION -d DISTRO [-b BRANCH_NAME] [-t TARBALL]
```

Details about the script parameters:

| Name        | Description                  | Example                |
|-------------|------------------------------|------------------------|
| VERSION     | Github Tag or version number  | 1.3.x                 |
| TARGET      | Target platform for the packages | ubuntu/18.04       |

Optionally the script supports the option __-b__ to specify a custom branch, this is useful to package and test _master_ or specific branches.

### Build examples

#### Package version 1.3.1 for Ubuntu 18.04:

```
$ ./build.sh -v 1.3.1 ubuntu/18.04
```


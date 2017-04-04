# Fluent Bit Packaging

This repository contains Docker files used to build [Fluent Bit](http://fluentbit.io) Linux packages for different distros, the following table describe the supported targets:

| Distro       |   Version / Code Name  | Arch   | Target Option           |
|--------------|------------------------|--------|-------------------------|
| CentOS       |   7                    | amd64  | centos/7                |
| Fedora       |   25                   | amd64  | fedora/25               |
| Ubuntu       |   16.10 / Yakkety Yak  | amd64  | ubuntu/16.10            |
| Ubuntu       |   16.04 / Xenial Xerus | amd64  | ubuntu/16.04            |
| Raspbian     |   8.x / Jessie         | armhf  | raspbian/jessie         |
| Kubernetes   |   N/A                  | amd64  | kubernetes/forwarder-dev|

## Usage

The _build.sh_ script can be used to build packages for a specific target, the command understand the following format:

```
$ ./build.sh [-b BRANCH_NAME] [VERSION] TARGET
```

Details about the script parameters:

| Name        | Description                  | Example                |
|-------------|------------------------------|------------------------|
| VERSION     | Github Tag or version number | 0.11.1                 |
| TARGET      | Target platform for the packages | ubuntu/16.10   |

Optionally the script supports the option __-b__ to specify a custom branch, this is useful to package and test _master_ or specific branches.

### Build examples

#### Package version 0.11.1 for Ubuntu 16.10:

```
$ ./build.sh 0.10.1 ubuntu/16.10
```

#### Package master branch for Ubuntu 16.10:

```
$ ./build.sh -b master ubuntu/16.10
```

# Fluent Bit Packaging

This repository contains Docker images used to build Linux packages of Fluent Bit for different distros, the following table describe the supported platforms:

| Distro       |   Version / Code Name  | Arch   | Target Option          |
|--------------|------------------------|--------|------------------------|
| Ubuntu       |   16.10 / Yakkety Yak  | amd64  | ubuntu/16.10           |
| Ubuntu       |   16.04 / Xenial Xerus | amd64  | ubuntu/16.04           |
| Raspbian     |   8.x / Jessie         | armhf  | raspbian/jessie        |

## Usage

The _build.sh_ script can be used to build packages for a specific target, the command understand the following format:

```
$ ./build.sh  VERSION  TARGET
```

Details about the script parameters:

| Name        | Description              | Example                |
|-------------|--------------------------|------------------------|
| VERSION     | Github branch name or version number | 0.10.1     |
| TARGET      | Target platform for the packages | ubuntu/16.10   |

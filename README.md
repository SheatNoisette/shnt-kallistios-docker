# KallistiOS Docker

Here is a basic Docker container for KallistiOS, the Dreamcast toolchain.
It supports the following architectures:
- x86_64
- aarch64

## Building the image

Building the container (~15 minutes build time):
```
docker build -t shnt-dreamcast-sdk .
```

## Use the image
Inside the Docker container, you can then drop a shell:
```
docker run -it --volume=$(pwd):/opt/src --workdir=/opt/src --rm shnt-dreamcast-sdk
```

Don't forget to source the environment file:
```
source /opt/toolchains/dc/kos/environ.sh
```

**Please note that the Docker container isn't perfect.**
It is meant to be a starting point for KallistiOS development.

# License
This project is licensed under the MIT license. A copy of the license is
included in the repository. See `LICENSE` for more information.

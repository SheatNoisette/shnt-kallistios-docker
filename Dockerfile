from ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

run apt-get update

# Get required packages
run apt-get install -y gcc git make patch texinfo wget tar bash xz-utils \
    automake autoconf libpng-dev libjpeg-dev
# Use clone with depth 1 to avoid getting the whole history of the repo
run git clone --depth 1 git://git.code.sf.net/p/cadcdev/kallistios /opt/toolchains/dc/kos

workdir /opt/toolchains/dc/kos/utils/dc-chain

# Use the stable version of the DC toolchain.
run mv config.mk.stable.sample config.mk

# Download gcc/bin-utils and extract them
run bash ./download.sh
run bash ./unpack.sh

# Override config.guess for old gcc to detect proprely newer environments
run cp -f /opt/toolchains/dc/kos/utils/dc-chain/config.guess \
    /opt/toolchains/dc/kos/utils/dc-chain/gcc-4.7.4/config.guess

# Use default envionment vars
run cp /opt/toolchains/dc/kos/doc/environ.sh.sample /opt/toolchains/dc/kos/environ.sh

# Build the toolchains
run make erase=1

# KOS Ports
run git clone --recursive git://git.code.sf.net/p/cadcdev/kos-ports /opt/toolchains/dc/kos-ports

# Build the ports
workdir /opt/toolchains/dc/kos-ports/utils
run source /opt/toolchains/dc/kos/environ.sh; ./build-all.sh
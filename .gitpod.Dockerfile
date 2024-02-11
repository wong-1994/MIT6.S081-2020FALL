# Use Ubuntu 20.04 image
FROM ubuntu:20.04

# Set env
ENV TZ=Asia/Shanghai \
    LANG=en_US.utf8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Install basic packages
RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    dos2unix \
    wget \
    vim \
    build-essential \
    gdb-multiarch \
    qemu-system-misc \
    gcc-riscv64-linux-gnu \
    binutils-riscv64-linux-gnu \
    libpixman-1-dev \
    gcc-riscv64-unknown-elf \
    libglib2.0-dev \
    pkg-config \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# Install qemu
RUN wget https://download.qemu.org/qemu-5.1.0.tar.xz 
RUN tar xf qemu-5.1.0.tar.xz 
RUN cd qemu-5.1.0 && \
    ./configure --disable-kvm --disable-werror --prefix=/usr/local --target-list=riscv64-softmmu && \
    make && \
    make install

# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod
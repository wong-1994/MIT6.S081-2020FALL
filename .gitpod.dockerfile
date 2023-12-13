# 使用 Ubuntu 20.04 镜像
FROM ubuntu:20.04

# 预定义环境变量
ENV DEBIAN_FRONTEND noninteractive

# 更新包列表并安装软件包
RUN apt-get update && \
    apt-get install -y \
    git \
    build-essential \
    gdb-multiarch \
    qemu-system-misc \
    gcc-riscv64-linux-gnu \
    binutils-riscv64-linux-gnu

# 清理不需要的软件包和缓存
# RUN apt-get autoremove -y && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /workspace
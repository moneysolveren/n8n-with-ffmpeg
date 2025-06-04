FROM ubuntu:20.04
# 強制重新部署 Ubuntu 版本 - 2025-06-04

ENV DEBIAN_FRONTEND=noninteractive

# 安裝 Node.js 和基礎工具
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    lsb-release

# 安裝 Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# 安裝 FFmpeg 和中文字體
RUN apt-get install -y \
    ffmpeg \
    fontconfig \
    fonts-wqy-zenhei

# 創建用戶
RUN useradd -m -s /bin/bash node

# 安裝 n8n
RUN npm install -g n8n

# 更新字體緩存
RUN fc-cache -fv

USER node
WORKDIR /home/node

EXPOSE 5678
CMD ["n8n", "start"]
USER node
WORKDIR /home/node

EXPOSE 5678
CMD ["n8n", "start"]

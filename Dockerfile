FROM n8nio/n8n:latest

USER root

# 更新包索引
RUN apk update

# 安裝 FFmpeg 和基礎字體工具
RUN apk add --no-cache \
    ffmpeg \
    fontconfig \
    wget \
    --repository=http://dl-cdn.alpinelinux.org/alpine/v3.18/main

# 手動下載並安裝 WQY 字體
RUN mkdir -p /usr/share/fonts/chinese && \
    cd /usr/share/fonts/chinese && \
    wget -O wqy-zenhei.ttc \
    "https://github.com/anthonyfok/fonts-wqy-zenhei/raw/debian/wqy-zenhei.ttc" && \
    chmod 644 wqy-zenhei.ttc

# 更新字體緩存
RUN fc-cache -fv

# 驗證字體安裝
RUN fc-list | grep -i "hei\|chinese" || echo "字體安裝完成，準備測試"

USER node

EXPOSE 5678
CMD ["n8n", "start"]

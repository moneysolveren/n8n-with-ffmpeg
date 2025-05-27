FROM n8nio/n8n:latest

USER root

# 安裝 ffmpeg 和其他可能需要的工具
RUN apk add --no-cache \
    ffmpeg \
    imagemagick \
    && rm -rf /var/cache/apk/*

USER node

# 設置環境變量（可選）
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=changeme123

EXPOSE 5678

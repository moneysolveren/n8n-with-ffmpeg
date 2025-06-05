FROM n8nio/n8n:latest

USER root

# 安裝 FFmpeg、curl 和中文字體
RUN apk add --no-cache \
    ffmpeg \
    curl \
    fontconfig \
    font-noto-cjk

# 更新字體緩存
RUN fc-cache -fv

USER node

# 設定環境變數
ENV N8N_DEFAULT_BINARY_DATA_MODE=filesystem

EXPOSE 5678
CMD ["n8n", "start"]

FROM n8nio/n8n:latest

USER root

# 安裝 FFmpeg 和中文字體
RUN apk add --no-cache \
    ffmpeg \
    fontconfig \
    font-noto-cjk

# 更新字體緩存
RUN fc-cache -fv

USER node

EXPOSE 5678
CMD ["n8n", "start"]

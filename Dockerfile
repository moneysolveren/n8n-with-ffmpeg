FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    ffmpeg \
    fontconfig \
    font-wqy-zenhei \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN fc-cache -fv

USER node

EXPOSE 5678
CMD ["n8n", "start"]

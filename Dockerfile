FROM alpine:edge
ENV RELEASE=v0.1.1
RUN apk add --no-cache jq curl tar bash && \
  mkdir /app && \
  cd /app && \
  curl -LO "https://github.com/kaakaa/matterpoll-emoji/releases/download/${RELEASE}/matterpoll-emoji-${RELEASE}-linux-x86_64.tar.gz" && \
  tar -xf matterpoll-emoji-${RELEASE}-linux-x86_64.tar.gz && \
  mv linux-x86_64/matterpoll-emoji ./ && \
  mv linux-x86_64/config.json ./ && \
  apk del curl tar
ADD entrypoint.sh /app/
WORKDIR /app
EXPOSE 8505
ENTRYPOINT /app/entrypoint.sh

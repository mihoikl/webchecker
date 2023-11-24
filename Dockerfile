
FROM alpine:3.15 AS downloader
ARG TEMPLATE_REPO=""

RUN apk add git \
       && git clone ${TEMPLATE_REPO} /tmp

FROM nginx:latest
#ARG TEMPLATE_NAME=""
COPY --from=downloader /tmp/${TEMPLATE_REPO}  /usr/share/nginx/html



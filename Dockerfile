FROM nginx:1.13.5-alpine

LABEL maintainer="Mark Lopez <m@silvenga.com>"

ENV REDIRECT_URL ""
ENV HTTP_STATUS_CODE "301"
ENV PORT "80"

COPY rootfs/ /

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["/bin/sh", "/init.sh"]
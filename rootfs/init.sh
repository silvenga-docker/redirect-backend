#!/bin/sh

[ -z "${REDIRECT_URL}" ] && echo "ERROR: REDIRECT_URL must be set (i.e. http://example.com:8080)." && exit 1;

echo "Will redirect all requests to '${REDIRECT_URL}'."
cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen       ${PORT};
    server_name  localhost;
    return ${HTTP_STATUS_CODE} ${REDIRECT_URL};
}
EOF

echo "Configurations start."
cat /etc/nginx/conf.d/default.conf
echo "Configurations end."

nginx -g "daemon off;"
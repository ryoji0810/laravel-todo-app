#!/bin/bash
# sleep 3  docker-composeで依存関係を設定してるのでコメントアウト
nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
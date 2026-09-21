#!/bin/sh
set -e
cat <<EOF > /usr/share/nginx/html/env.js
window.__ENV__ = {
  API_BASE_URL: "${API_BASE_URL}"
};
EOF
#!/usr/bin/env bash
mkdir -p .pub-cache

cat <<EOF > ~/.pub-cache/credentials.json
{
  "accessToken":"$PUB_ACCESS_TOKEN",
  "refreshToken":"$PUB_REFRESH_TOKEN",
  "tokenEndpoint":"https://accounts.google.com/o/oauth2/token",
  "scopes":["https://www.googleapis.com/auth/userinfo.email","openid"],
  "expiration":$PUB_EXPIRATION
}
EOF

pub publish -f
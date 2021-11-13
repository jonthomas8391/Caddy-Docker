FROM caddy:2.4.6-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-ratelimit

FROM caddy:2.4.6-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

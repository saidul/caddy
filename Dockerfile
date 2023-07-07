FROM caddy:2.7-builder AS builder

RUN xcaddy build \
    --with github.com/darkweak/souin/plugins/caddy \
    --with github.com/baldinof/caddy-supervisor

FROM caddy:2.7
LABEL maintainer="Saidul Islam <saidul.04@gmail.com>"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["/usr/bin/caddy", "--conf", "/etc/Caddyfile", "--log", "stdout"]
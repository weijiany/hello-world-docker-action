FROM koalaman/shellcheck-alpine:v0.9.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

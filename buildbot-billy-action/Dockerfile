FROM debian:9.5-slim

ADD entrypoint.sh /entrypoint.sh

ADD messages.json /messages.json

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
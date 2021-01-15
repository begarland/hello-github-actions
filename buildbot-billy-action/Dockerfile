FROM debian:9.5-slim

ADD messages.json /messages.json
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
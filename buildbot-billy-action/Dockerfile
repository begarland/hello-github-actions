FROM debian:9.5-slim

ADD entrypoint.sh /entrypoint.sh

ADD channels.json /channels.json
ADD messages.json /messages.json
ADD users.json /users.json

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
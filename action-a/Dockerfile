FROM debian:9.5-slim

ADD entrypoint.sh ./../test.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

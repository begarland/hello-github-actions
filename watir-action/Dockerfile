FROM debian:9.5-slim


# RUN gem install bundler


# RUN bundle config https://gems.weblinc.com
# RUN bundle install --deployment

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM debian:9.5-slim



FROM ruby:2.6.6

RUN bundle config https://gems.weblinc.com
RUN echo cd $GITHUB_WORKSPACE/testDir/anotherDir
RUN bundle install --deployment

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

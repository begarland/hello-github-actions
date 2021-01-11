FROM debian:9.5-slim



FROM ruby:2.6.6

RUN gem install bundler

RUN bundle config https://gems.weblinc.com
# RUN echo cd $GITHUB_WORKSPACE/testDir/anotherDir
RUN BUNDLE_GEMFILE=$GITHUB_WORKSPACE/testDir/anotherDir/Gemfile bundle install --deployment

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

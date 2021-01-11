FROM debian:9.5-slim



FROM ruby:2.6.6

RUN gem install bundler

RUN echo cd $GITHUB_WORKSPACE/testDir/anotherDir
RUN pwd
RUN ls
ADD Gemfile Gemfile 

RUN bundle config https://gems.weblinc.com
RUN bundle install --deployment

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


ADD Foo bar
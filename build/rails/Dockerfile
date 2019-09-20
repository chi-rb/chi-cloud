FROM ruby:2.6

ARG RAILS_ENV
COPY ./bin/* /usr/local/bin/
WORKDIR /rails

RUN install
ENV BUNDLE_JOBS=3
ENV BUNDLE_PATH=/rails/vendor/bundle/ruby/2.6.0

RUN compile
CMD run

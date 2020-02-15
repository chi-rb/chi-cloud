FROM ruby:2.7

ARG RAILS_ENV
COPY ./bin/* /usr/local/bin/
WORKDIR /rails
 
ENV BUNDLE_JOBS=3
ENV GEM_HOME=/rails/vendor/bundle
ENV BUNDLE_PATH=/rails/vendor/bundle
ENV EDITOR=vim
 
RUN install
RUN compile

CMD start

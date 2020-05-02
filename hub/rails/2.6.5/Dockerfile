FROM chirb/ruby:2.6.5

ARG RAILS_ENV
ARG RAILS_MASTER_KEY
ENV BUNDLE_JOBS=3
ENV GEM_HOME=/rails/vendor/bundle
ENV BUNDLE_PATH=/rails/vendor/bundle

COPY cmd /usr/local/bin/start-rails
WORKDIR /rails
CMD start-rails

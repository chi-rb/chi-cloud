FROM chirb/ruby:2.5.3

ENV BUNDLE_JOBS=3
ENV GEM_HOME=/rails/vendor/bundle
ENV BUNDLE_PATH=/rails/vendor/bundle

RUN /mnt/compile
WORKDIR /rails
CMD start

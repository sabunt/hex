FROM ruby:2.6.3-alpine

ARG secret_token
ARG db_host

ENV RACK_ENV=production
ENV RAILS_ENV=production
ENV APP_HOME=/app
ENV SECRET_KEY_BASE=$secret_token
ENV DB_HOST=$db_host
ENV HEX_APP_DATABASE_PASSWORD=docker

WORKDIR $APP_HOME
RUN apk --no-cache add --update  \
  bash \
  curl \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  nodejs \
  tzdata

COPY ./ $APP_HOME

RUN gem install bundler && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install --without development test && \
    bundle exec rails assets:precompile

EXPOSE 3000

CMD rm -f /app/tmp/pids/server.pid && rails db:migrate && rails server -b 0.0.0.0

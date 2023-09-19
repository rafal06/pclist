FROM ruby:3.2.2-slim

RUN apt update \
    && apt install -y tini libvips-tools libpq-dev make gcc nodejs npm --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
RUN npm i -g yarn

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN rails assets:precompile

RUN apt purge -y make gcc nodejs npm

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

EXPOSE 3000
ENTRYPOINT ["tini", "--"]
CMD rm -f /app/tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0

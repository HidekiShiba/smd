FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs \
  yarn \
  vim
  # mysql-server \
  # mysql-client

WORKDIR /smd

COPY Gemfile /smd/Gemfile
COPY Gemfile.lock /smd/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets
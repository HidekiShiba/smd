FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs \
  vim
  # mysql-server \
  # mysql-client

WORKDIR /smd

COPY Gemfile /smd/Gemfile
COPY Gemfile.lock /smd/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
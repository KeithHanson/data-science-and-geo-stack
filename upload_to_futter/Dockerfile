FROM ruby:2.7.1-buster

# Install prerequisites and copy app into container.
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /upload_to_futter/
WORKDIR /upload_to_futter/
COPY Gemfile /upload_to_futter/Gemfile
COPY Gemfile.lock /upload_to_futter/Gemfile.lock
RUN bundle install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install --no-install-recommends yarn
COPY . /upload_to_futter/
RUN bundle exec yarn install --check-files
RUN bundle exec rails webpacker:install
RUN bundle exec rails assets:precompile

# Setup entrypoint script and expose port.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80

# Default command to execute.
CMD ["rails", "server", "--environment", "production", "--binding", "0.0.0.0", "--port", "80"]

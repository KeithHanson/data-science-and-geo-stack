FROM ruby:2.7.1-buster

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /upload_to_futter/
WORKDIR /upload_to_futter/
COPY Gemfile /upload_to_futter/Gemfile
COPY Gemfile.lock /upload_to_futter/Gemfile.lock
RUN bundle install
COPY . /upload_to_futter/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

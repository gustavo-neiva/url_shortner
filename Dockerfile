FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y postgresql-client nodejs zlib1g-dev liblzma-dev patch apt-utils libxml2-dev libxslt1-dev
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /app


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD bundle exec rails s -p 3000 -b '0.0.0.0'
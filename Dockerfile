FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /CarSellingPortal
WORKDIR /CarSellingPortal
COPY Gemfile /CarSellingPortal/Gemfile
COPY Gemfile.lock /CarSellingPortal/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /CarSellingPortal

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

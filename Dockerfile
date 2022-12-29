FROM ruby:3.1

RUN mkdir /sample-docker-rails7
WORKDIR /sample-docker-rails7
COPY Gemfile /sample-docker-rails7/Gemfile
COPY Gemfile.lock /sample-docker-rails7/Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /sample-docker-rails7

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]


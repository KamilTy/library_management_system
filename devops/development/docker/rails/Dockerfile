# Dockerfile
# frozen_string_literal: true

FROM ruby:3.3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Set working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /app

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

# Use an official Ruby runtime as a parent image
FROM ruby:3.0.2

ENV RAILS_ENV=development
ENV RACK_ENV=development

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install bundler and gems
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the application code into the container
COPY . .

# Expose port 3002 to the outside world
EXPOSE 3002

# Start the application
CMD ["rails", "server", "-b", "0.0.0.0"]
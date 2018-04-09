# Use this image to generate container
FROM ruby:2.5-slim
# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# Set path
ENV INSTALL_PATH /pdvend_products
# Build directory
RUN mkdir -p $INSTALL_PATH
# Set path like the main diretory
WORKDIR $INSTALL_PATH
# Copy the Gemfile into the container
COPY Gemfile Gemfile.lock ./
# Set path to Gems
ENV BUNDLE_PATH /box
# Copy code into container
COPY . .

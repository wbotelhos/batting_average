FROM ruby:2.7.1-alpine

WORKDIR /var/www/app

COPY Gemfile* ./

RUN bundle install

COPY . /var/www/app

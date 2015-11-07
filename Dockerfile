FROM ruby:2.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /ziher
WORKDIR /ziher
COPY Gemfile /ziher/Gemfile
COPY Gemfile.lock /ziher/Gemfile.lock
RUN bundle install

COPY . /ziher
RUN rake assets:precompile --trace RAILS_ENV=production

FROM ruby:2.6.0

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /cybrilla_assignment
WORKDIR /cybrilla_assignment

ADD Gemfile /cybrilla_assignment/Gemfile
ADD Gemfile.lock /cybrilla_assignment/Gemfile.lock
RUN gem update --system
RUN gem install bundler -v 2.0.1
RUN bundle install

ADD . /cybrilla_assignment
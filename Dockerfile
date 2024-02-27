FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql  

RUN mkdir /Budget-App
RUN gem install bundler -v 2.3.6
WORKDIR /Budget-App
ENV BUNDLER_VERSION 2.3.6

ADD Gemfile /Budget-App/Gemfile
ADD Gemfile.lock /Budget-App/Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle update
RUN bundle check || bundle install 

ADD . /Budget-App

CMD ["rails", "server", "-b", "0.0.0.0"]


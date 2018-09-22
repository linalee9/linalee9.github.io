FROM alpine:3.7

RUN apk update && apk upgrade && apk --update add \
    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libstdc++ tzdata bash ca-certificates \
    &&  echo 'gem: --no-document' > /etc/gemrc

COPY ./Gemfile Gemfile

RUN apk --update add readline readline-dev libxml2 libxml2-dev libxslt  \
    libxslt-dev python zlib zlib-dev ruby-dev yaml \
      yaml-dev libffi libffi-dev build-base nodejs \
        ruby-irb ruby-json ruby-rdoc git nginx

RUN gem install eventmachine -v '1.2.7' --source 'https://rubygems.org/'

RUN apk --update add openjdk8-jre

RUN gem install s3_website

RUN bundle update
RUN bundle install --system

RUN apk del build-base readline-dev libxml2-dev libxslt-dev zlib-dev \
    ruby-dev yaml-dev libffi-dev

VOLUME ["/docs"]
EXPOSE 4000 35729 3000 80

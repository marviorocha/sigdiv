FROM ruby:2.5.3-alpine
LABEL maintainer="Marvio Rocha"

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \ 
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      yarn 

RUN gem install bundler -v 2.0.2
ENV HOME /home/marviorocha/teste-backend

WORKDIR $HOME

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install 

RUN yarn install --check-files

RUN apk update

COPY . ./ 

COPY ./docker-tools/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["./docker-tools/docker-entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]

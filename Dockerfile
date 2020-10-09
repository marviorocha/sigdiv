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
# Install binary to run PDF
# libstdc++ \
# libx11 \
# libxrender \
# libxext \
# libssl1.1 \
# ca-certificates \
# fontconfig \
# freetype \
# ttf-dejavu \
# ttf-droid \
# ttf-freefont \
# ttf-liberation \
# ttf-ubuntu-font-family \
# && apk add --update --no-cache --virtual .build-deps \
# msttcorefonts-installer \
# \
# # Install microsoft fonts
# && update-ms-fonts \
# && fc-cache -f \
# \
# # Clean up when done
# && rm -rf /tmp/* \
# && apk del .build-deps

RUN gem install bundler -v 2.0.2
ENV HOME /home/marviorocha/sigdiv

WORKDIR $HOME

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install 

RUN yarn install --check-files

RUN gem install rubocop

RUN apk update

COPY . ./ 

COPY ./docker-tools/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["./docker-tools/docker-entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]

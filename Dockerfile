FROM ruby:3.1

ARG RAILS_MASTER_KEY

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
    curl gnupg2 apt-utils default-libmysqlclient-dev git libcurl3-dev cmake \
    libssl-dev pkg-config openssl imagemagick file nodejs yarn
RUN mkdir /app
WORKDIR /app 

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT ["sh", "./entrypoint.sh"]

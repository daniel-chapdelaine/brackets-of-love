FROM ruby:3.1

ARG RAILS_MASTER_KEY

# Environment Variables
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

# Installs
RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
    curl gnupg2 apt-utils default-libmysqlclient-dev git libcurl3-dev cmake \
    libssl-dev pkg-config openssl imagemagick file nodejs yarn

ENV NODE_VERSION=18.15.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

# Ruby
RUN mkdir /app
WORKDIR /app 

COPY Gemfile Gemfile.lock ./
RUN bundle install

# React
RUN npm install -g yarn
COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . .

EXPOSE 3000

ENTRYPOINT ["sh", "./entrypoint.sh"]

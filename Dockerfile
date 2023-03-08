# this fetches a prebuilt docker image for us to customize
FROM ruby:3.1
# # install rails dependencies
# RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
#     curl gnupg2 apt-utils default-libmysqlclient-dev git libcurl3-dev cmake \
#     libssl-dev pkg-config openssl imagemagick file nodejs yarn
ARG RAILS_MASTER_KEY

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

# RUN mkdir /app
# WORKDIR /app

# # Adding gems
# COPY Gemfile Gemfile
# COPY Gemfile.lock Gemfile.lock
# RUN bundle install

# COPY . /app

# # RUN rails assets:precompile

# # Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

# EXPOSE 3000

# # Start the main process.
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

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
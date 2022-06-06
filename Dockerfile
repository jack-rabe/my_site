FROM ruby:3.1.2

RUN apt-get update -yq && apt-get upgrade -yq;
RUN apt install nodejs -yq && apt-get install npm -yq;
RUN npm install --global yarn;

EXPOSE 3000

# copy local files to container (must be done later to preserve cache)
COPY ./app_container /app_container
WORKDIR /app_container
# install dependencies
RUN npm i; bundle install;
# start server
CMD ["rails", "server", "-b", "0.0.0.0"]

# README

## Steps for local environment

Project runs on Rails 5.2 and Ruby 2.4.1

- Place master.key on config/ dir.
- Set database credentials, copy config/database.template.yml to config/database.yml.
- If you like so, then import database from dump.sql
- Run bundle install
- Run rake db:migrate
- Run rails s to start the server.

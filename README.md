# README

## Instructions for local environment

Project runs on Rails 5.2 (api only) and Ruby 2.4.1

### Project settings

- Place `master.key` on `config` dir.
- Set database credentials, copy `config/database.template.yml` to `config/database.yml`.
- If you like so, then import database from dump.sql or run `rake db:migrate` instead.
- Run `bundle install`.

## Instructions for API use

### JWT authentication

- JWT token expiration time is `1 hour`.
- For token request use `/login` endpoint (applies for customer / admin users as well).

### Users and roles

- Users model uses role enum for role validation.
- Admin users has role: `admin`.
- Regular users has role: `customer`.
- Only admins can modify products.

### Products features

- Uses `ransack` gem for search and sorting.
- Uses `kaminari` gem for pagination.
- User `paranoia` gem for soft deletes.
- Uses `audited` gem for price changes tracking.

### Products search and pagination

- For name search use `q[name_cont]` param.
- For page change use `page` param

# learning_tapestry

### Made using Ruby 2.3.1

## Requirements

* PostgreSQL 12.1
* Ruby 2.3.1
* PSQL 12.3
* Bundler 1.16.6

## Setting up the local DB
To begin, we will first setup a local dev copy of the database. We will be logging in with the default postgres user `postgres`. If you modified the default postgres user, please login with the appropriate user.

```
psql postgres
CREATE ROLE learning_tapestry_admin WITH LOGIN PASSWORD 'sKHnWjJcupRX0S8D';
CREATE DATABASE learning_tapestry_dev;
GRANT ALL PRIVILEGES ON DATABASE learning_tapestry_dev TO learning_tapestry_admin;
```

## To install

Open up a terminal and enter the following

```
git clone git@github.com:BrianAllenGit/learning_tapestry.git
cd learning_tapestry/
bundle install
rake fetch_data
```

## To run
```
cd learning_tapestry/
ruby lib/app.rb
```

## To access

The running app can be accessed at http://localhost:8080/resources through the browser, or through Postman
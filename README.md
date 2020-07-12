# learning_tapestry

# Made using Ruby 2.3.1

## Requirements

PostgreSQL 12.1
Ruby 2.3.1
PSQL 12.3

## Setting up the local DB
To begin, we must setup a local dev copy of the database. We will be loggin in with the default postgres user `postgres`. If you modified the default postgres user, please login with the appropriate user.

```
psql postgres
CREATE ROLE learning_tapestry_admin WITH LOGIN PASSWORD 'sKHnWjJcupRX0S8D';
CREATE DATABASE learning_tapestry_dev;
GRANT ALL PRIVILEGES ON DATABASE learning_tapestry_dev TO learning_tapestry_admin;
```

## To install
CD into directory
```
bundle install
```

## To run
CD into directory
```
ruby lib/app.rb
```

## To access
localhost:8080
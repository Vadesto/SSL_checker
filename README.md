# SSL checker

## This project represents a simple SSL checker that can show basic info about SSL protocols:

- All good
- Expires in a week (or less)
- Expires in two weeks (or less)
- Expired
- Bad SSL (revorked; self-signed;e.t.c)

## Made with:

* Ruby v6

* Sidekiq and sidekiq-scheduler

* PostgreSQL

* Redis

* API made using Grape (not implemented yet)

## How to run it:

- Clone this project using `git clone https://github.com/Vadesto/SSL_checker.git`

- Copy .env-exmple to .env

- run `bundle install`

- run `docker-compose up`

- run `foreman start`

- you can access sidekiq's ui at `localhost:3000/sidekiq/`

- you can add new Links for checking SSL using `rails c` and `Link.create!(url:"{URL}")`

## API:

- use GET /api/status to get all of the domains and their statuses

- use POST /api/domain and url as a parameter to add a new domain to the database

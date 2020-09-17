# README

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

- run `bundle install`

- run `docker-compose up`

- run `foreman start`

- you can add new Links for checking SSL using `rails c` and `Link.add(url:"{URL}")`

## API:

-not implemented yet. README will be updated later

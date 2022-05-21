# README

## Approaches for merging content-data and user-data together

### Store only user-data in database, fetch content-data from CMS on demand and merge them in runtime right before responding to user

#### Pros

* Data is always up-to-date

* Less database usage

#### Cons

* We won't get the data if CMS request is failed

* More request execution time due to additional request to the third-party service

* Additional payments for requests amount

### Store both user- and content-data in the database, keep content-data up-to-date using CMS webhooks

#### Pros

* Higher service reliability

* Less request execution time

* Cheaper due to less requests amount

#### Cons

* More database usage

* Data could be not up-to-date

### How I decided to choose the second variant

* Simplier project architecture

* With webhooks data could be not up-to-date in really rare cases

* Service speed and reliability is more important than database usage

## Setup

* Clone the git repository

* Setup ruby v.3.0.3

* Copy `development.key` and `test.key` to config/credentials directory

* Run `bundle`

* Run `rails db:create`, `rails db:migrate`

* Run `rails server`

* Run `ngrok http 3000` in terminal

* Copy link and paste to Contentful's webhook named sync

## API documentation

* Run project locally

* Open `localhost:3000/api-docs

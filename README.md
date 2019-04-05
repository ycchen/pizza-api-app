# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Pizza api app

```
  rails new pizza-api-app --api -T

  # add rspec
  rails g rspec:install

  # add user model

  rails g model user name:string username:string email:string password_digest:string

  # add user controller

  rails g controller users
  
```
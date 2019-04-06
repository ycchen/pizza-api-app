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

```ruby
  rails new pizza-api-app --api -T

  # add rspec
  rails g rspec:install

  # add user model

  rails g model user name:string username:string email:string password_digest:string

  # add user controller

  rails g controller users

  # add authentication controller

  rails g controller authentication
  
```

* curl test example

```ruby
# create user

curl -d "name=usertwo&username=usertwo&email=usertwo@test.com&password=password1234&password_confirmation=password1234" -X POST http://localhost:3000/users

# auth login

curl -d "email=userone@test.com&password=12345678" -X POST "http://localhost:3000/auth/login"

=> curl -d "email=userone@test.com&password=12345678" -X POST "http://localhost:3000/auth/login"
{"token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTQ2MDUwMjh9.iNky7vyflX7h0rocr8rVvCKNkM1TU_tvxf7tdv8tAjQ","exp":"04-06-2019 22:43","username":"userone"}


# get users with JWT

curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTQ2MDUwMjh9.iNky7vyflX7h0rocr8rVvCKNkM1TU_tvxf7tdv8tAjQ" "http://localhost:3000/users"

=>[{"id":1,"name":"userone","username":"userone","email":"userone@test.com","password_digest":"$2a$10$GiHOLMgqN4jPpdbniVdmNu2D24TlAFT4jn9xjtvZyDkfyVM5w2zIy","created_at":"2019-04-06T02:17:22.391Z","updated_at":"2019-04-06T02:17:22.391Z"},{"id":2,"name":"usertwo","username":"usertwo","email":"usertwo@test.com","password_digest":"$2a$10$oncJ2bZqhvqUmWhh78MoJOXuBooP/qNwRyiyT59Eb5HUNgqumSJ7K","created_at":"2019-04-06T02:28:50.211Z","updated_at":"2019-04-06T02:28:50.211Z"}]


# get user 'userone'
curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTQ2MDUwMjh9.iNky7vyflX7h0rocr8rVvCKNkM1TU_tvxf7tdv8tAjQ" "http://localhost:3000/users/userone"

=> {"id":1,"name":"userone","username":"userone","email":"userone@test.com","password_digest":"$2a$10$GiHOLMgqN4jPpdbniVdmNu2D24TlAFT4jn9xjtvZyDkfyVM5w2zIy","created_at":"2019-04-06T02:17:22.391Z","updated_at":"2019-04-06T02:17:22.391Z"}
```
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

* Models

```ruby
# Pizza model
rails g model Pizza name:string price:decimal
# has_many :toppings
# has_many :pizza_orders
# has_many :orders, throught: :pizza_orders

# Topping model
rails g model Topping name:string
# has_many :pizzas

# Pizza and Topping join model
rails g model PizzaTopping topping:references pizza:references
# belongs_to :pizza
# belongs_to :topping

# Order model
rails g model Order user:references total:decimal
# belongs_to :user
# has_many :pizza_orders
# has_many :pizzas through: :pizza_orders

# Order and pizza join model
rails g model PizzaOrder order:references pizza:references quantity:integer
# belongs_to :order
# belongs_to :pizza


 class Pizza < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  
  has_many :pizza_toppings
  has_many :toppings, through: :pizza_toppings
 end

 class Topping < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :pizza_toppings
  has_many :pizzas, through: :pizza_toppings
 end

 class PizzaTopping < ActiveRecord::Base
  belongs_to :pizza
  belongs_to :topping
 end

 class Order < ActiveRecord::Base
  belongs_to :user

  has_many :pizza_orders, dependent: :destroy
  has_many :pizzas, throught: :pizza_orders
 end

 class PizzaOrder < ActiveRecord::Base
  belongs_to :pizza
  belongs_to :order

  validates :quantity, presence: true
 end

```
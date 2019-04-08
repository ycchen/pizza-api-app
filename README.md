# README

** Pizza api app

-- Setup 
```
# create database, migration, seed data and prepare for test

rails db:{create,migrate,seed,test:prepare}

# Start server

rails s

# Start test

rspec .

```

-- CI/CD with Heroku

```ruby
# For testing purpose, you can list users on Heroku
  
  https://desolate-harbor-15422.herokuapp.com/

  https://desolate-harbor-15422.herokuapp.com/user
  
  [
    {
      "id": 1,
      "name": "admin",
      "username": "admin",
      "email": "admin@test.com"
    }
  ]
  
```

** curl test example

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
-- Screen shots:

1. Authenication

<img width="661" alt="Screen Shot 2019-04-08 at 6 01 20 PM" src="https://user-images.githubusercontent.com/339032/55760234-7e432780-5a29-11e9-8000-b21c5add9117.png">

2. List all pizzas

<img width="617" alt="Screen Shot 2019-04-08 at 6 02 18 PM" src="https://user-images.githubusercontent.com/339032/55760233-7daa9100-5a29-11e9-8bcb-999660e30a15.png">

3. Create order

<img width="618" alt="Screen Shot 2019-04-08 at 6 03 06 PM" src="https://user-images.githubusercontent.com/339032/55760232-7daa9100-5a29-11e9-9866-fbdb43097f14.png">

4. List orders

<img width="567" alt="Screen Shot 2019-04-08 at 6 05 27 PM" src="https://user-images.githubusercontent.com/339032/55760231-7daa9100-5a29-11e9-8f18-5448c2fd2eb1.png">



-- Notes

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

** Models

```ruby
# Pizza model
rails g model Pizza name:string 'price:decimal{5,2}'
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
rails g model Order user:references 'total:decimal{5,2}'
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


# generate controller

rails g controller Pizzas

rails g controller Toppings

rails g controller Orders

# generate serializer

rails g serializer pizza

rails g serializer topping

rails g serializer order

rails g serializer user


```

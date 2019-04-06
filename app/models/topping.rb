class Topping < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :pizza_toppings
  has_many :pizzas, through: :pizza_toppings
end

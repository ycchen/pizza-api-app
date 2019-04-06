class Pizza < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  
  has_many :pizza_toppings
  has_many :toppings, through: :pizza_toppings
end

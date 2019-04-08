# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :pizza_orders
  has_many :pizzas, through: :pizza_orders

  validates :user_id, presence: true

  before_validation :set_total

  def set_total
    self.total = 0
    pizza_orders.each do |po|
      self.total += po.pizza.price * po.quantity
    end
  end

  def build_pizza_order_with_pizza_ids_and_quantities(pizza_ids_and_quantities)
    pizza_ids_and_quantities.each do |pizza_and_quantity|
      id, quantity = pizza_and_quantity
      pizza_orders.build(pizza_id: id, quantity: quantity)
    end
  end
end

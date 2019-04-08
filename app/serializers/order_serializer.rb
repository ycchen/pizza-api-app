# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user, :total
  belongs_to :user
  has_many :pizza_orders
  has_many :pizzas, throug: :pizza_orders
end

# frozen_string_literal: true

FactoryBot.define do
  factory :pizza_order do
    pizza
    order
    quantity { 1 }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :pizza_topping do
    pizza
    topping
  end
end

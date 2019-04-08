# frozen_string_literal: true

FactoryBot.define do
  factory :topping do
    name { FFaker::Lorem.unique.word }
  end
end

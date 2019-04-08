# frozen_string_literal: true

FactoryBot.define do
  factory :pizza do
    name { FFaker::Lorem.unique.word }
    price { 10.59 }

    after(:create) do |p|
      t = FactoryBot.create(:topping, name: FFaker::Lorem.unique.word)
      FactoryBot.create(:pizza_topping, pizza: p, topping: t)
    end
  end
end

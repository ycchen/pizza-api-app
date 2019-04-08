FactoryBot.define do
  factory :order do
    user
    total { 0 }

    after(:create) do |p|
      3.times{ FactoryBot.create(:pizza_order, order: p, quantity: 2) }
    end
  end
end
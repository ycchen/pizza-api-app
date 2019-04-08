# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::Name.first_name }
    username { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    password { 'password1234' }
    password_confirmation { 'password1234' }
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 8 },
            if: -> { new_record? || !password.nil? }

  has_many :orders, dependent: :destroy
  has_many :pizzas, through: :orders
end

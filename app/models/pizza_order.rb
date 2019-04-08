# frozen_string_literal: true

class PizzaOrder < ApplicationRecord
  belongs_to :order
  belongs_to :pizza
end

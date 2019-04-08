# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PizzaOrder, type: :model do
  let(:pizza_order) { FactoryBot.build(:pizza_order) }
  subject { pizza_order }

  it { should respond_to(:order_id) }
  it { should respond_to(:pizza_id) }
  it { should respond_to(:quantity) }
  it { should belong_to(:order) }
  it { should belong_to(:pizza) }
end

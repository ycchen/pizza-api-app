# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.build :order }
  subject { order }

  it { should respond_to(:total) }
  it { should respond_to(:user_id) }
  it { should validate_presence_of :user_id }

  it { should belong_to :user }
  it { should have_many(:pizza_orders) }
  it { should have_many(:pizzas).through(:pizza_orders) }

  describe '#set_total' do
    before(:each) do
      pizza_one = FactoryBot.create(:pizza, price: 10)
      pizza_two = FactoryBot.create(:pizza, price: 15)

      pizza_order_one = FactoryBot.build(:pizza_order, pizza: pizza_one, quantity: 2)
      pizza_order_two = FactoryBot.build(:pizza_order, pizza: pizza_two, quantity: 2)

      @order = FactoryBot.build(:order)
      @order.pizza_orders << pizza_order_one
      @order.pizza_orders << pizza_order_two
    end

    it 'returns the total amount of order' do
      expect do
        @order.set_total
      end.to change { @order.total.to_f }.from(0).to(50)
    end
  end

  describe '#build_pizza_order_with_pizza_ids_and_quantities' do
    before(:each) do
      pizza_one = FactoryBot.create(:pizza, price: 10)
      pizza_two = FactoryBot.create(:pizza, price: 15)

      @pizza_ids_and_quantities = [[pizza_one.id, 2], [pizza_two.id, 2]]
    end

    it 'build 2 pizza_orders for the order' do
      expect  do
        order.build_pizza_order_with_pizza_ids_and_quantities(@pizza_ids_and_quantities)
      end.to change {
        order.pizza_orders.size
      }.from(0).to(2)
    end
  end
end

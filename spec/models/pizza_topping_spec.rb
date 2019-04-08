require 'rails_helper'

RSpec.describe PizzaTopping, type: :model do
  let(:pizza_topping) { FactoryBot.build(:pizza_topping) }
  subject { pizza_topping }

  it { should respond_to(:topping_id) }
  it { should respond_to(:pizza_id) }
  
  it { should belong_to(:topping) }
  it { should belong_to(:pizza) }
end

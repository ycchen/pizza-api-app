# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Topping, type: :model do
  let(:topping) { FactoryBot.build :topping }
  subject { topping }

  it { should validate_presence_of :name }
end

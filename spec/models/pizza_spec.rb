# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pizza, type: :model do
  let(:pizza) { FactoryBot.build :pizza }
  subject { pizza }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should have_many(:toppings) }
end

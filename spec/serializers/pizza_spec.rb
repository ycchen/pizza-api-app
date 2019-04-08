# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PizzaSerializer, type: :serializer do
  let(:user) { create(:user) }
  let(:pizza) { create(:pizza) }

  let(:serializer) { PizzaSerializer.new(pizza) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  let(:json) { JSON.parse(serialization.to_json) }

  it 'is json' do
    puts json
    expect(json['id']).to eq(pizza.id)
    expect(json['name']).to eq(pizza.name)
  end
end

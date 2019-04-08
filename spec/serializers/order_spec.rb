# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderSerializer, type: :serializer do
  let(:user) { FactoryBot.create(:user) }
  let(:order) { FactoryBot.create(:order, user: user) }

  let(:serializer) { OrderSerializer.new(order) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  let(:json) { JSON.parse(serialization.to_json) }

  it 'is json' do
    expect(json['id']).to eq(order.id)
  end
end

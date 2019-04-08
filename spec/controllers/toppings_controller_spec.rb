# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ToppingsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    authenticated_header(request, @user)
  end

  describe 'GET #index' do
    it 'returns toppings' do
      5.times do
        FactoryBot.create(:topping)
      end

      get :index

      expect(json_response.size).to eq(5)
    end
  end
end

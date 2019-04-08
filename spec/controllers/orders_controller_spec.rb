# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    authenticated_header(request, @user)
  end

  describe 'GET #index' do
    it "returns user's orders" do
      5.times do
        FactoryBot.create(:order, user: @user)
      end

      get :index

      expect(json_response.size).to eq(5)
    end
  end

  describe 'GET #show' do
    it "returns user's order" do
      order = FactoryBot.create(:order, user: @user)

      get :show, params: { id: order.id }

      puts json_response.inspect
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it "create an new order" do
      p_one = FactoryBot.create(:pizza, name: FFaker::Lorem.unique.word, price: 10.50)
      p_two = FactoryBot.create(:pizza, name: FFaker::Lorem.unique.word, price: 10.50)

      order_params = {
          "pizza_ids_and_quantities": [
              [p_one.id, 1],
              [p_two.id, 2]
          ]
      }

      post :create, params: { order: order_params }, as: :json

      expect(json_response[:total].to_f).to eq(31.5)
    end

  end
end

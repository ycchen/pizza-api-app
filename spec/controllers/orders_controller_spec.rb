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

  describe 'Get #show' do
    it "returns user's order" do
      order = FactoryBot.create(:order, user: @user)

      get :show, params: { id: order.id }

      puts json_response.inspect
      expect(response).to have_http_status(:success)
    end
  end
end

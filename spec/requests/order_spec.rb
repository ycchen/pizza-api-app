require 'rails_helper'

RSpec.describe "Order", :type => :request do
  describe "Order requests" do
    before(:each) do
      @user = FactoryBot.create(:user)
      params = { email: @user.email, password: @user.password }
      post '/auth/login',params: params, headers: headers, as: :json
      @token = json_response[:token]
      @headers = {'Authorization': @token }
    end

    context '#create' do
      it "creates an order" do
        p_one = FactoryBot.create(:pizza, name: FFaker::Lorem.unique.word, price: 10.50)
        p_two = FactoryBot.create(:pizza, name: FFaker::Lorem.unique.word, price: 10.50)
        p_three = FactoryBot.create(:pizza, name: FFaker::Lorem.unique.word, price: 10.50)
        

        order_params = {
            "pizza_ids_and_quantities": [
              [p_one.id, 1],
              [p_two.id, 2],
              [p_three.id, 1]
            ]
        }
        
        post "/orders", params: {order: order_params}, headers: @headers, as: :json

        result = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
      end
    end

    context '#index' do
      before(:each) do
          pizza_one = FactoryBot.create(:pizza, price: 10.00)
          pizza_two = FactoryBot.create(:pizza, price: 15.00)
    
          pizza_order_one = FactoryBot.build(:pizza_order, pizza: pizza_one, quantity: 2)
          pizza_order_two = FactoryBot.build(:pizza_order, pizza: pizza_two, quantity: 2)
    
          @order = FactoryBot.build(:order, user: @user)
          @order.pizza_orders << pizza_order_one
          @order.pizza_orders << pizza_order_two
          @order.save

          @order2 = FactoryBot.build(:order, user: @user)
          @order2.pizza_orders << pizza_order_one
          @order2.pizza_orders << pizza_order_two
          @order2.save
      end

      it "lists all orders for a user" do
        get "/orders", headers: @headers, as: :json
        
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(result.size).to eq(2)
      end
    end

  end
end
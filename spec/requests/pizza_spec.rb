# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pizza', type: :request do
  describe 'Pizza requests' do
    before(:each) do
      # headers = { 'CONTENT_TYPE' => 'application/json' }
      @user = FactoryBot.create(:user)
      # @token = JsonWebToken.encode(user_id: @user.id)
      params = { email: @user.email, password: @user.password }
      post '/auth/login', params: params, headers: headers, as: :json
      @token = json_response[:token]
      @headers = { 'Authorization': @token }
    end

    context '#index' do
      it 'returns 5 pizzas' do
        5.times do
          FactoryBot.create(:pizza, name: FFaker::Lorem.unique.word)
        end

        get '/pizzas', headers: @headers, as: :json

        result = JSON.parse(response.body)
        expect(result.size).to eq(5)
      end
    end

    context '#show' do
      it 'return pizza information' do
        pizza = FactoryBot.create(:pizza, name: 'Pizza one')

        get "/pizzas/#{pizza.id}", headers: @headers, as: :json

        result = JSON.parse(response.body)

        expect(result['name']).to eq('Pizza one')
      end
    end
  end
end

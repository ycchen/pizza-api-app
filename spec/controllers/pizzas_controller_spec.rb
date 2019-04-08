# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PizzasController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    authenticated_header(request, @user)
  end

  describe 'GET #index' do
    it 'returns 5 pizzas' do
      5.times do
        FactoryBot.create(:pizza)
      end

      get :index

      expect(json_response.size).to eq(5)
    end
  end

  describe 'GET #show' do
    it 'returns pizza information' do
      pizza = FactoryBot.create(:pizza, name: 'Big pizza')

      get :show, params: { id: pizza.id }

      expect(json_response[:name]).to eq('Big pizza')
    end
  end
end

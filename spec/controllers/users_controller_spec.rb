# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    authenticated_header(request, @user)
  end

  describe 'GET #index' do
    it 'returns users' do
      5.times do
        FactoryBot.create(:user)
      end

      get :index

      expect(json_response.size).to eq(6)
    end
  end
end

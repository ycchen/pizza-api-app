# frozen_string_literal: true

require 'rails_helper'
require 'jwt'

RSpec.describe AuthenticationController, type: :controller do
  describe '#login' do
    before do
      @user = FactoryBot.create(:user)
      @token = JsonWebToken.encode(user_id: @user.id)
    end

    it 'returns JWT' do
      puts @token
    end
  end
end

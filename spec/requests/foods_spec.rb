require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /foods' do
    it 'works!' do
      get foods_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /foods/new' do
    it 'should be found' do
      get new_food_path
      expect(response).to have_http_status(:found)
    end
  end
end

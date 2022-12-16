require 'rails_helper'

RSpec.describe 'GeneralShoppingLists', type: :request do
  describe 'GET /general_shopping_lists' do
    it 'should find general shopping list' do
      get '/general_shopping_lists'
      expect(response).to have_http_status(302)
    end
  end
end

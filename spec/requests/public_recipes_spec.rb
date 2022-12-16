require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /public_recipes' do
    it 'should work' do
      get public_recipes_path
      expect(response).to have_http_status(302)
    end
  end
end

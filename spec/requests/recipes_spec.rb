require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    it "should to found" do
      get recipes_path
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /recipes/new" do
    it "should to found" do
      get new_recipe_path
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /recipes/:id" do
    it "should to found" do
      get recipe_path(1)
      expect(response).to have_http_status(:found)
    end
  end
end

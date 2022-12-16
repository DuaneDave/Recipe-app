class PublicRecipesController < ApplicationController
  def public
    @public_recipes = Recipe.includes(:user, :foods).where(public: true).order(created_at: :desc)
  end
end

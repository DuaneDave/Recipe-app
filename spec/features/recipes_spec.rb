require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Recipes', type: :feature do
  before(:all) do
    @user = User.create(name: 'Ernest', email: 'ernestadonu@yahoo.com', confirmed_at: Time.now,
                        password: '@34Recipe')
    @recipe1 = Recipe.create(name: 'Rice', description: 'Rice is the food of the day', preparation_time: 3,
                             cooking_time: 3, user: @user, public: false)
    @recipe2 = Recipe.create(name: 'Beans', description: 'Beans is the food of the day', preparation_time: 3,
                             cooking_time: 1, user: @user, public: true)
    @all_recipe = [@recipe1, @recipe2]
  end

  describe 'GET /recipes' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit recipes_path
    end

    it 'displays all recipes' do
      @all_recipe.each do |recipe|
        expect(page).to have_content(recipe.name)
        expect(page).to have_content(recipe.description)
      end
    end

    it 'displays a link to create a new recipe' do
      expect(page).to have_link('Add Recipe')
    end

    it 'displays a link to delete a recipe' do
      expect(page).to have_button('Remove')
    end

    it 'redirects to the new recipe page when the add recipe link is clicked' do
      click_link 'Add Recipe'
      expect(page).to have_current_path(new_recipe_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength

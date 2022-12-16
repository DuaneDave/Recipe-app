require 'rails_helper'

RSpec.feature 'GeneralShoppingLists', type: :feature do
  before(:all) do
    @user = User.create(name: 'Ernest', email: 'ernestadonu@yahoo.com', confirmed_at: Time.now, password: '@34Recipe')
  end

  describe 'GET /general_shopping_lists' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit general_shopping_lists_path
    end

    it 'displays all recipes' do
      expect(page).to have_content('General Shopping List')
    end
  end
end

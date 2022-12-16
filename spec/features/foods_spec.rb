require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Foods', type: :feature do
  before(:all) do
    @user = User.create(name: 'Ernest', email: 'ernestadonu@yahoo.com', confirmed_at: Time.now,
                        password: '@34Recipe')
    @food1 = Food.create(name: 'Rice', measurement_unit: 'kg', price: 1000, quantity: 1, user: @user)
    @food2 = Food.create(name: 'Beans', measurement_unit: 'kg', price: 1000, quantity: 1, user: @user)
    @food3 = Food.create(name: 'Yam', measurement_unit: 'kg', price: 1000, quantity: 1, user: @user)

    @all_food = [@food1, @food2, @food3]
  end

  describe 'GET /foods' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it 'displays all foods' do
      @all_food.each do |food|
        expect(page).to have_content(food.name)
      end
    end

    it 'displays a link to create a new food' do
      expect(page).to have_link('Add Food')
    end

    it 'displays a link to delete a food' do
      expect(page).to have_button('Delete')
    end

    it 'redirects to the new food page when the add food link is clicked' do
      click_link 'Add Food'
      expect(page).to have_current_path(new_food_path)
    end
  end

  describe 'GET /foods/new' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      click_link 'Add Food'
    end

    it 'displays a form to create a new food' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Measurement Unit')
      expect(page).to have_field('Price')
      expect(page).to have_field('Quantity')
      expect(page).to have_button('Submit')
    end

    it 'redirects to the foods page when the create food button is clicked' do
      fill_in 'Name', with: 'Rice'
      fill_in 'Measurement Unit', with: 'kg'
      fill_in 'Price', with: 1000
      fill_in 'Quantity', with: 1
      click_button 'Submit'
      expect(page).to have_current_path(foods_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength

require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    subject { RecipeFood.create(quantity: 1, food_id: 1, recipe_id: 2) }
    before { subject.save }

    it 'should have numeric quantity' do
      subject.quantity = 'a'
      expect(subject).to_not be_valid
    end
  end
end

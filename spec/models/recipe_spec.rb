require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    subject { Recipe.create(name: 'Ernest', description: 'A description', preparation_time: 1, cooking_time: 3) }
    before { subject.save }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have positive integer preparation time' do
      subject.preparation_time = -1
      expect(subject).to_not be_valid
    end

    it 'should have positive integer cooking time' do
      subject.cooking_time = -1
      expect(subject).to_not be_valid
    end
  end
end

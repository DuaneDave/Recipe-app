require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.create(name: 'Ernest', email: 'recipeapp@gmail.com') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end

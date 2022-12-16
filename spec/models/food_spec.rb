require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    subject { Food.create(name: 'Ernest', measurement_unit: 'kg', price: 10, quantity: 1) }
    before { subject.save }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a measurement unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer price' do
      subject.price = -1
      expect(subject).to_not be_valid
    end
  end
end

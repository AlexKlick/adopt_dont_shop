require 'rails_helper'

RSpec.describe PetApp do

  describe 'relationships' do
    it { should belong_to(:pet) }
    it { should belong_to(:app) }
  end

  describe 'validations' do
    it { should validate_presence_of(:pet_id) }
    it { should validate_presence_of(:app_id) }
  end

  describe 'class methods' do
    describe '#pending_pets' do
      xit 'returns the pet apps/ pets from a shelter which are pending approval' do
        
      end
    end
  end
end
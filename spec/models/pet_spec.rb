require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'relationships' do
    it { should belong_to(:shelter) }
    it { should have_many(:pet_apps) }
    it { should have_many(:apps) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_numericality_of(:age) }
  end

  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)
    @app = App.create(name: 'Scooby', street: "123", city:"fake", state: "fake", zip: 48248)
    @app2 = App.create(name: 'Doo', street: "456", city:"more-fake", state: "denial", zip: 80204)
    @pet_app1 = @app.pet_apps.create!(pet_id: @pet_2.id)
    @pet_app2 = @app.pet_apps.create!(pet_id: @pet_1.id)
    @pet_app3 = @app2.pet_apps.create!(pet_id: @pet_2.id)
  end

  describe 'class methods' do
    describe '#search' do
      it 'returns partial matches' do
        expect(Pet.search("Claw")).to eq([@pet_2])
      end
    end

    describe '#adoptable' do
      it 'returns adoptable pets' do
        expect(Pet.adoptable).to eq([@pet_1, @pet_2])
      end
    end

    describe '#update_adoptability' do
      it 'updates the attribute adoptable for all pets on app, given app_id and boolean value for changing adoptability' do
        expect(Pet.pluck(:adoptable)).to eq([true, true, false])
        Pet.update_adoptability(@app.id, false)
        expect(Pet.pluck(:adoptable)).to eq([false, false, false])
      end
    end
  end

  describe 'instance methods' do
    describe '.shelter_name' do
      it 'returns the shelter name for the given pet' do
        expect(@pet_3.shelter_name).to eq(@shelter_1.name)
      end
    end
  end
end

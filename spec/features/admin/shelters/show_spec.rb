require 'rails_helper'

RSpec.describe 'the admin shelter show' do
  before(:each) do
    @shelter1 = Shelter.create!(name:'Detroit Human People', city:'Detroit', foster_program:true, rank: 6)
    @shelter2 = Shelter.create!(name:'Another Shelter', city:'Las Angeles', foster_program:true, rank: 7)
    @shelter3 = Shelter.create!(name:'a shelter', city:'Denver', foster_program:false, rank: 3)
    @shelter6 = Shelter.create!(name:'San Antonio Humane Society', city:'Marquette', foster_program:true, rank: 1)
    @shelter7 = Shelter.create!(name:'Marquette Humane Society', city:'San Antonio', foster_program:true, rank: 2)

    @pet1 = Pet.create(name:'Muffin',adoptable:true,breed:'fluffy cat',age:5, shelter_id: @shelter6.id, pic:'20210429_144443.jpg')
    @pet2 = Pet.create(name:'Tesla',adoptable:true,breed:'hunter cat',age:4, shelter_id: @shelter7.id, pic:'tesla.jpg')
    @pet3 = Pet.create(name:'Cosmos',adoptable:true,breed:'playful cat',age:4, shelter_id: @shelter7.id, pic:'20210429_144443.jpg')

    @app = App.create(name: 'Scooby', street: "123", city:"fake", state: "fake", zip: 48248)

    @pet_app1 = @app.pet_apps.create!(pet_id: @pet2.id)
    @pet_app2 = @app.pet_apps.create!(pet_id: @pet1.id)
    @pet_app3 = PetApp.create(pet_id: @pet1.id, app_id: @app.id)
    @pet_app4 = PetApp.create(pet_id: @pet3.id, app_id: @app.id)
    @pet_app5 = PetApp.create(pet_id: @pet2.id, app_id: @app.id)
  end

  # Story 19
  # SQL Only Story
  # Admin Shelters Show Page
  # As a visitor
  # When I visit an admin shelter show page
  # Then I see that shelter's name and full address
  it 'lists the shelters name and address' do 
    visit "/admin/shelters/#{@shelter1.id}"
    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter1.city)
  end

    # Story 22
  # Average Pet Age
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the average age of all adoptable pets for that shelter
  xit 'has a stats section, where we find the average age of all adoptable pets for the shelter' do
    within("#statistics") do
      
    end
  end

  # Story 23
  # Count of Adoptable Pets
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the number of pets at that shelter that are adoptable
  xit 'stats section has the number of adoptable pets for the shelter' do
    
  end

  # Story 24
  # Count of Pets that have been Adopted
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the number of pets that have been adopted from that shelter
  # Note: A Pet has been adopted from a shelter if they are part of an approved application
  xit 'has the number of pets that have been adopted from this shelter' do
    
  end

  # Story 25
  # Action Required
  # When I visit an admin shelter show page
  # Then I see a section titled "Action Required"
  # In that section, I see a list of all pets for 
  # this shelter that have a pending application 
  # and have not yet been marked "approved" or "rejected"
  xit 'has a list of pets from shelter with pending apps, which require action' do
    
  end

  # Story 26
  # Action Required Links to Application Show Page
  # When I visit an admin shelter show page
  # And I look in the "Action Required" section
  # Then next to each pet's name I see a link to the admin application 
  # show page where I can accept or reject the pet.
  xit 'each pets name is a link to the show page, where approve or reject' do
    
  end
end

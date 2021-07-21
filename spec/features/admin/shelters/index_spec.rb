require 'rails_helper'

RSpec.describe 'the Admin Shelters Index' do
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

  # Story 10
  # SQL Only Story
  # When I visit the admin shelter index ('/admin/shelters')
  # Then I see all Shelters in the system listed in reverse alphabetical order by name

  it 'shows all of the shelters in reverse order' do
    visit '/admin/shelters'
    expect(@shelter2.name).to appear_before(@shelter1.name)
    expect(@shelter3.name).to appear_before(@shelter1.name)
  end

  # Story 11
  # When I visit the admin shelter index ('/admin/shelters')
  # Then I see a section for "Shelter's with Pending Applications"
  # And in this section I see the name of every shelter that has a pending application
  it 'has a section with the shelters that have pending apps' do
    visit '/admin/shelters'
    within('div#pending_apps') do
      expect(page).to have_content(@shelter6.name)
      expect(page).to have_content(@shelter7.name)
      expect(page).to_not have_content(@shelter1.name)
      expect(page).to_not have_content(@shelter2.name)
      expect(page).to_not have_content(@shelter3.name)
    end

  end

  # Story 19
  # Shelters with Pending Applications Listed Alphabetically
  # When I visit the admin shelter index ('/admin/shelters')
  # And I look in the section for shelters with pending applications
  # Then I see all those shelters are listed alphabetically

  it 'section for pending apps shows shelters listed alphabetically' do
    visit '/admin/shelters'
    within("#pending_apps") do
      expect("Marquette Humane Society").to appear_before("San Antonio Humane Society")
    end
  end

  # Story 20
  # Admin Shelters Show Page Links
  # When I visit the admin shelter index ('/admin/shelters')
  # Then I see that every shelter name is a link
  # When I click one of these links
  # Then I am taken to that shelter's admin show page

  it 'every shelter name is a link, takes to admin shelter show page' do
    visit '/admin/shelters'
    within("#pending_apps") do
      expect(page).to have_link("Marquette Humane Society")
      expect(page).to have_link("San Antonio Humane Society")
      click_on("Marquette Humane Society")
    end
    expect(current_path).to eq("/admin/shelters/#{@shelter7.id}")
  end
end
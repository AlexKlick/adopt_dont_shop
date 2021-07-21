require 'rails_helper'

RSpec.describe 'the admin apps show page' do
  before(:each) do
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @app = App.create(name: 'Scooby', street: "123", city:"fake", state: "fake", zip: 48248)
    @pet1 = Pet.create(name:'Muffin',adoptable:true,breed:'fluffy cat',age:5, shelter_id: @shelter.id, pic:'20210429_144443.jpg')
    @pet2 = Pet.create(name:'Tesla',adoptable:true,breed:'hunter cat',age:4, shelter_id: @shelter.id, pic:'tesla.jpg')
    @pet3 = Pet.create(name:'Cosmos',adoptable:true,breed:'playful cat',age:4, shelter_id: @shelter.id, pic:'20210429_144443.jpg')
    @app = App.create(name: 'Scooby', street: "123", city:"fake", state: "fake", zip: 48248)
    @pet_app1 = @app.pet_apps.create!(pet_id: @pet2.id)
    @pet_app2 = @app.pet_apps.create!(pet_id: @pet1.id)
    visit "/admin/apps/#{@app.id}"

  end
  # Story 12
  # When I visit an admin application show page ('/admin/applications/:id')
  # For every pet that the application is for, I see a button to approve the application for that specific pet
  # When I click that button
  # Then I'm taken back to the admin application show page
  # And next to the pet that I approved, I do not see a button to approve this pet
  # And instead I see an indicator next to the pet that they have been approved
  it 'has a button to approve an application for a specific pet. Upon clicking, the pet shows approved and the button is gone' do
    within(".table") do
      #has only 4 inputs, 2 reject 2 accept
      expect(page).to have_css("input", :count => 4)
      expect(page).to have_css("td##{@pet_app1.id}-approve")
      expect(page).to have_css("td##{@pet_app1.id}-reject")
      expect(page).to have_css("td##{@pet_app2.id}-approve")
      expect(page).to have_css("td##{@pet_app2.id}-reject")
      within("##{@pet_app2.id}-reject") do
        click_on('Reject')
      end
    end
    within(".table") do
      #expect only 2 inputs left, replaced by rejected status in table
      expect(page).to have_css("input", :count => 2)
      expect(page).to have_css("td##{@pet_app1.id}-approve")
      expect(page).to have_css("td##{@pet_app1.id}-reject")
      #these 2 buttons gone
      expect(page).to_not have_css("td##{@pet_app2.id}-approve")
      expect(page).to_not have_css("td##{@pet_app2.id}-reject")
      #expect replaced by updated status 
      within("td##{@pet_app2.id}-status") do
        #interesting note: status wasn't updated on the object in rspec.. 
        #must be cached? Needed reload by finding it in PetApp to pass
        expect(page).to have_content("Status: #{PetApp.find(@pet_app2.id).status}")
      end
    end
  end
  # Story 13
  # When I visit an admin application show page ('/admin/applications/:id')
  # For every pet that the application is for, I see a button to reject the application for that specific pet
  # When I click that button
  # Then I'm taken back to the admin application show page
  # And next to the pet that I rejected, I do not see a button to approve or reject this pet
  # And instead I see an indicator next to the pet that they have been rejected

  xit 'has a reject application button for each pet which upon clicking is removed and the pet shows as rejected' do
    
  end

  # Story 13
  # When there are two applications in the system for the same pet
  # When I visit the admin application show page for one of the applications
  # And I approve or reject the pet for that application
  # When I visit the other application's admin show page
  # Then I do not see that the pet has been accepted or rejected for that application
  # And instead I see buttons to approve or reject the pet for this specific application

  xit 'approving or rejecting an app for a pet does not change their other apps status' do
    
  end

  # Story 14
  # When I visit an admin application show page
  # And I approve all pets for an application
  # Then I am taken back to the admin application show page
  # And I see the application's status has changed to "Approved"

  xit 'when all pets are approved on an app, the app status is changed to approved' do
    
  end

  # Story 15
  # When I visit an admin application show page
  # And I reject one or more pets for the application
  # And I approve all other pets on the application
  # Then I am taken back to the admin application show page
  # And I see the application's status has changed to "Rejected"

  xit 'if one pet is rejected, and then other pets approved, it shows rejjected for entrie app' do
    

  end

  # Story 16
  # When I visit an admin application show page
  # And I approve all pets on the application
  # And when I visit the show pages for those pets
  # Then I see that those pets are no longer "adoptable"
  xit 'once a pet is on an approved application, the pets show page shows not adoptable' do
    
  end

  # Story 17
  # When a pet has an "Approved" application on them
  # And when the pet has a "Pending" application on them
  # And I visit the admin application show page for the pending application
  # Then next to the pet I do not see a button to approve them
  # And instead I see a message that this pet has been approved for adoption
  # And I do see a button to reject them

  xit 'pet has both approved and pending app, on pending app show - pet has no approval button, but message adopted and reject button' do
    
  end

  # Story 21
  # Average Pet Age
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the average age of all adoptable pets for that shelter
  xit 'has a stats section, where we find the average age of all adoptable pets for the shelter' do
    
  end

  # Story 22
  # Count of Adoptable Pets
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the number of pets at that shelter that are adoptable
  xit 'stats section has the number of adoptable pets for the shelter' do
    
  end

  # Story 23
  # Count of Pets that have been Adopted
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the number of pets that have been adopted from that shelter
  # Note: A Pet has been adopted from a shelter if they are part of an approved application
  xit 'has the number of pets that have been adopted from this shelter' do
    
  end

  # Story 24
  # Action Required
  # When I visit an admin shelter show page
  # Then I see a section titled "Action Required"
  # In that section, I see a list of all pets for 
  # this shelter that have a pending application 
  # and have not yet been marked "approved" or "rejected"
  xit 'has a list of pets from shelter with pending apps, which require action' do
    
  end

  # Story 25
  # Action Required Links to Application Show Page
  # When I visit an admin shelter show page
  # And I look in the "Action Required" section
  # Then next to each pet's name I see a link to the admin application 
  # show page where I can accept or reject the pet.
  xit 'each pets name is a link to the show page, where approve or reject' do
    
  end

end
require 'rails_helper'

RSpec.describe 'the admin apps show page' do

  # Story 12
  # When I visit an admin application show page ('/admin/applications/:id')
  # For every pet that the application is for, I see a button to approve the application for that specific pet
  # When I click that button
  # Then I'm taken back to the admin application show page
  # And next to the pet that I approved, I do not see a button to approve this pet
  # And instead I see an indicator next to the pet that they have been approved
  it 'has a button to approve an application for a specific pet. Upon clicking, the pet shows approved and the button is gone' do

  end
  # Story 13
  # When I visit an admin application show page ('/admin/applications/:id')
  # For every pet that the application is for, I see a button to reject the application for that specific pet
  # When I click that button
  # Then I'm taken back to the admin application show page
  # And next to the pet that I rejected, I do not see a button to approve or reject this pet
  # And instead I see an indicator next to the pet that they have been rejected

  it 'has a reject application button for each pet which upon clicking is removed and the pet shows as rejected' do
    
  end

  # Story 13
  # When there are two applications in the system for the same pet
  # When I visit the admin application show page for one of the applications
  # And I approve or reject the pet for that application
  # When I visit the other application's admin show page
  # Then I do not see that the pet has been accepted or rejected for that application
  # And instead I see buttons to approve or reject the pet for this specific application

  it 'approving or rejecting an app for a pet does not change their other apps status' do
    
  end

  # Story 14
  # When I visit an admin application show page
  # And I approve all pets for an application
  # Then I am taken back to the admin application show page
  # And I see the application's status has changed to "Approved"

  it 'when all pets are approved on an app, the app status is changed to approved' do
    
  end

  # Story 15
  # When I visit an admin application show page
  # And I reject one or more pets for the application
  # And I approve all other pets on the application
  # Then I am taken back to the admin application show page
  # And I see the application's status has changed to "Rejected"

  it 'if one pet is rejected, and then other pets approved, it shows rejjected for entrie app' do
    

  end

  # Story 16
  # When I visit an admin application show page
  # And I approve all pets on the application
  # And when I visit the show pages for those pets
  # Then I see that those pets are no longer "adoptable"
  it 'once a pet is on an approved application, the pets show page shows not adoptable' do
    
  end

  # Story 17
  # When a pet has an "Approved" application on them
  # And when the pet has a "Pending" application on them
  # And I visit the admin application show page for the pending application
  # Then next to the pet I do not see a button to approve them
  # And instead I see a message that this pet has been approved for adoption
  # And I do see a button to reject them

  it 'pet has both approved and pending app, on pending app show - pet has no approval button, but message adopted and reject button' do
    
  end

  # Story 21
  # Average Pet Age
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the average age of all adoptable pets for that shelter
  it 'has a stats section, where we find the average age of all adoptable pets for the shelter' do
    
  end

  # Story 22
  # Count of Adoptable Pets
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the number of pets at that shelter that are adoptable
  it 'stats section has the number of adoptable pets for the shelter' do
    
  end

  # Story 23
  # Count of Pets that have been Adopted
  # When I visit an admin shelter show page
  # Then I see a section for statistics
  # And in that section I see the number of pets that have been adopted from that shelter
  # Note: A Pet has been adopted from a shelter if they are part of an approved application
  it 'has the number of pets that have been adopted from this shelter' do
    
  end

  # Story 24
  # Action Required
  # When I visit an admin shelter show page
  # Then I see a section titled "Action Required"
  # In that section, I see a list of all pets for 
  # this shelter that have a pending application 
  # and have not yet been marked "approved" or "rejected"
  it 'has a list of pets from shelter with pending apps, which require action' do
    
  end

  # Story 25
  # Action Required Links to Application Show Page
  # When I visit an admin shelter show page
  # And I look in the "Action Required" section
  # Then next to each pet's name I see a link to the admin application 
  # show page where I can accept or reject the pet.
  it 'each pets name is a link to the show page, where approve or reject' do
    
  end

end
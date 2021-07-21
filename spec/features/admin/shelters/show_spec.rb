require 'rails_helper'

RSpec.describe 'the admin shelter show' do

  # Story 19
  # SQL Only Story
  # Admin Shelters Show Page
  # As a visitor
  # When I visit an admin shelter show page
  # Then I see that shelter's name and full address
  xit 'lists the shelters name and address' do 

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

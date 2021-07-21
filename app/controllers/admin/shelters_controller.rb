class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.sort_alphabetically('shelters','name', 'asc')
    @pending_shelters = Shelter.pending_apps
  end
  def show
    @shelter = Shelter.sql_query(shelter_params[:id])
    @pet_average_age = @shelter.pet_average_age
    @adopted_pet_count = @shelter.adopted_pet_count
    @pets_adoptable_count = @shelter.pets_adoptable_count
    @pending_pets = @shelter.pending_pets
  end

  private

  def shelter_params
    params.permit(:id)
  end
end
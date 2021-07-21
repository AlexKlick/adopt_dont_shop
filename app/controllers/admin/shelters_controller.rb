class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.sort_alphabetically('shelters','name', 'asc')
    @pending_shelters = Shelter.pending_apps
  end
  def show
    @shelter = Shelter.sql_query(shelter_params[:id])
    @pet_average_age = @shelter.pet_average_age
  end

  private

  def shelter_params
    params.permit(:id)
  end
end
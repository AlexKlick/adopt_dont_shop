class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.sort_alphabetically('shelters','name', 'asc')
    @pending_shelters = Shelter.pending_apps
  end
  def show
    @shelter = Shelter.find(shelter_params[:id])
  end

  private

  def shelter_params
    params.permit(:id)
  end
end
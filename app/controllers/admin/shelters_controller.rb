class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.sort_alphabetically('shelters','name', 'asc')
    @pending_shelters = Shelter.pending
  end
end
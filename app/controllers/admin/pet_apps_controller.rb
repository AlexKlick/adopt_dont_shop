class Admin::PetAppsController < ApplicationController
  def update
    pet_app = PetApp.find(pet_apps_params[:id])
    pet_app.update(status: pet_apps_params[:status])
    #all pet_apps decesions made
    if pet_app.app.pet_apps.where(status: :pending) == []
      #none rejected
      if pet_app.app.pet_apps.where(status: :rejected) == []
        pet_app.app.update(status: :Approved)
        #update all pets in application to adoptable = false
        Pet.update_adoptability(pet_app.app_id, false)
      #some rejected
      else
        pet_app.app.update(status: :Rejected)
      end
    end
    redirect_to "/admin/apps/#{pet_app.app.id}"
  end

  private

  def pet_apps_params
    params[:id] = params[:id].to_i
    params.permit(:id, :status)
  end
end
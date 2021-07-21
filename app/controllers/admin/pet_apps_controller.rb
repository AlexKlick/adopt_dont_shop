class Admin::PetAppsController < ApplicationController
  def update
    pet_app = PetApp.find(pet_apps_params[:id])
    pet_app.update(status: pet_apps_params[:status])
    if pet_app.app.pet_apps.where(status: :pending) == []
      if pet_app.app.pet_apps.where(status: :rejected) == []
        pet_app.app.update(status: :Approved)
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
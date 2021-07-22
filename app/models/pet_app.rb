class PetApp < ApplicationRecord
  belongs_to :pet
  belongs_to :app
  enum status: { pending: 0, approved: 1, rejected: 2 }
  validates :pet_id, presence: true
  validates :app_id, presence: true

  def self.pending_pets(shelter_id)
    select('pets.name, pet_apps.app_id as app_id')
    .joins(pet: :shelter)
    .where('status = 0')
    .where('shelters.id  = ?', shelter_id)
  end
end
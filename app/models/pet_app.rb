class PetApp < ApplicationRecord
  belongs_to :pet
  belongs_to :app
  enum status: { pending: 0, approved: 1, rejected: 2 }
  validates :pet_id, presence: true
  validates :app_id, presence: true
end
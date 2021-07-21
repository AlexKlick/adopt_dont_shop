class Pet < ApplicationRecord
  has_many :pet_apps, dependent: :destroy 
  has_many :apps, through: :pet_apps
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def self.update_adoptability(id, update_value)
    joins(pet_apps: :app)
    .where('apps.id = ?', id)
    .update_all(adoptable: update_value)
  end
end

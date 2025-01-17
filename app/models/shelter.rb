class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true, numericality: true
  validates :city, presence: true

  has_many :pets, dependent: :destroy

  def self.order_by_recently_created
    order(created_at: :desc)
  end

  def self.order_by_number_of_pets
    select("shelters.*, count(pets.id) AS pets_count")
      .joins("LEFT OUTER JOIN pets ON pets.shelter_id = shelters.id")
      .group("shelters.id")
      .order("pets_count DESC")
  end

  def pet_count
    pets.count
  end

  def adoptable_pets
    pets.where(adoptable: true)
  end

  def alphabetical_pets
    adoptable_pets.order(name: :asc)
  end

  def shelter_pets_filtered_by_age(age_filter)
    adoptable_pets.where('age >= ?', age_filter)
  end

  def self.pending_apps
    joins(pets: :pet_apps)
    .where('pet_apps.status = 0')
    .order(name: :asc)
    .distinct
  end

  def self.sql_query(id)
    find_by_sql(
      "SELECT city, name, id 
      FROM shelters 
      WHERE shelters.id = #{id}
      LIMIT 1
      ").first
  end

  def pet_average_age
    pets
    .average(:age)
    .to_i
  end

  def pets_adoptable_count
    pets
    .where(adoptable: true)
    .count
  end

  def adopted_pet_count
    pets
    .joins(pet_apps: :app)
    .where('apps.status = ?', 2)
    .count
  end
end

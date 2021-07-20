class CreatePetApps < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_apps do |t|
      t.references :app, foreign_key: true
      t.references :pet, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

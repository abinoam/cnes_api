class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :county
      t.string :state, limit: 2
      t.string :region
      t.string :zipcode
      t.string :district
      t.string :street
      t.string :street_number
      t.string :complement
      t.belongs_to :health_care_establishment, index: true

      t.timestamps null: false
    end
  end
end

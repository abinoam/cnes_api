class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :origin
      t.belongs_to :Address, index: true

      t.timestamps null: false
    end
  end
end

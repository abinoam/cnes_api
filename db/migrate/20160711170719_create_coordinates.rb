class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.float :latitude
      t.float :longitude
      t.string :origin
      t.string :last_update
      t.belongs_to :location, index: true

      t.timestamps null: false
    end
  end
end

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :county
      t.string :state, limit: 2
      t.string :region
      t.string :zipcode
      t.string :district
      t.string :street
      t.string :street_number
      t.belongs_to :HealthCareEstablishment, index: true

      t.timestamps null: false
    end
  end
end

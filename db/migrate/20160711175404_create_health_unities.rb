class CreateHealthUnities < ActiveRecord::Migration
  def change
    create_table :health_unities do |t|
      t.text :description
      t.belongs_to :health_care_establishment, index: true

      t.timestamps null: false
    end
  end
end

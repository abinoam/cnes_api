class CreateHealthUnities < ActiveRecord::Migration
  def change
    create_table :health_unities do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end

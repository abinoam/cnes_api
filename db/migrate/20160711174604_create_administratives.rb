class CreateAdministratives < ActiveRecord::Migration
  def change
    create_table :administratives do |t|
      t.string :kind
      t.belongs_to :health_care_establishment

      t.timestamps null: false
    end
  end
end

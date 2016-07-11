class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :cnpj
      t.string :name
      t.belongs_to :HealthCareEstablishment

      t.timestamps null: false
    end
  end
end

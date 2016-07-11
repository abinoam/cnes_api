class CreateHealthCareEstablishments < ActiveRecord::Migration
  def change
    create_table :health_care_establishments do |t|
      t.string :cnes_code
      t.string :ibge_code
      t.string :company_name
      t.string :fantasy_name

      t.timestamps null: false
    end
  end
end

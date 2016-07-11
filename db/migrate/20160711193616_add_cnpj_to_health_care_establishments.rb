class AddCnpjToHealthCareEstablishments < ActiveRecord::Migration
  def change
    add_column :health_care_establishments, :cnpj, :string
  end
end

class AddContactsInfoToHealthCareEstablishments < ActiveRecord::Migration
  def change
    add_column :health_care_establishments, :email, :string
    add_column :health_care_establishments, :fax, :string
    add_column :health_care_establishments, :phone, :string
  end
end

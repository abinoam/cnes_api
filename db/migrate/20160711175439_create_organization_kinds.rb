class CreateOrganizationKinds < ActiveRecord::Migration
  def change
    create_table :organization_kinds do |t|
      t.string :kind
      t.belongs_to :health_care_establishment, index: true

      t.timestamps null: false
    end
  end
end

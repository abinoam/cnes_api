class CreateOrganizationKinds < ActiveRecord::Migration
  def change
    create_table :organization_kinds do |t|
      t.string :kind

      t.timestamps null: false
    end
  end
end

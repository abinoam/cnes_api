class CreateAdministratives < ActiveRecord::Migration
  def change
    create_table :administratives do |t|
      t.string :kind

      t.timestamps null: false
    end
  end
end

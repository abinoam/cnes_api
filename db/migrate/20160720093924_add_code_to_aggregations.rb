class AddCodeToAggregations < ActiveRecord::Migration
  def change
    add_column :organization_kinds, :code, :integer
    add_column :administratives, :code, :integer
    add_column :health_unities, :code, :integer
    add_column :teaching_activities, :code, :integer
  end
end

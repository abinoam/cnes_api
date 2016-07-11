class CreateTeachingActivities < ActiveRecord::Migration
  def change
    create_table :teaching_activities do |t|
      t.string :activity
      t.belongs_to :health_care_establishment

      t.timestamps null: false
    end
  end
end

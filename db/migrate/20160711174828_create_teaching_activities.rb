class CreateTeachingActivities < ActiveRecord::Migration
  def change
    create_table :teaching_activities do |t|
      t.string :activity

      t.timestamps null: false
    end
  end
end

class AddUserActivitiesTable < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.integer :user_id
      t.integer :activity_id
      t.boolean :checked, default: false
    end
  end
end

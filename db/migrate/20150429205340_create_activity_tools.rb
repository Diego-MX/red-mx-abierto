class CreateActivityTools < ActiveRecord::Migration
  def change
    create_table :activity_tools do |t|
      t.integer :activity_id
      t.integer :tool_id

      t.timestamps
    end
  end
end

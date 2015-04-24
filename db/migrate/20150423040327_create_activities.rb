class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :position
      t.integer :step_id

      t.timestamps
    end
  end
end

class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :position
      t.integer :stage_id

      t.timestamps
    end
  end
end

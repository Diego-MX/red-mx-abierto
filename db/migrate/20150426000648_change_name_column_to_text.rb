class ChangeNameColumnToText < ActiveRecord::Migration
  def up
    change_column :activities, :name, :text
  end

  def down
    change_column :activities, :name, :string
  end
end

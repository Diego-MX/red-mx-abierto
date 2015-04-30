class AddIconToTools < ActiveRecord::Migration
  def change
    add_column :tools, :icon, :string
  end
end

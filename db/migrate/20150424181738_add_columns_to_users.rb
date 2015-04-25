class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :government_type, :text
    add_column :users, :state, :text
    add_column :users, :municipality, :text
    add_column :users, :deputation, :text
    add_column :users, :dependency_name, :text
    add_column :users, :full_name, :text
  end
end

class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :government_type, :string
    add_column :users, :state, :string
    add_column :users, :municipality, :string
    add_column :users, :deputation, :string
    add_column :users, :dependency_name, :string
    add_column :users, :full_name, :string
  end
end

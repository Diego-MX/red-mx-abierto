class ChangeTextTypeForString < ActiveRecord::Migration
def up
    change_column :users, :government_type, :string
    change_column :users, :state, :string
    change_column :users, :municipality, :string
    change_column :users, :deputation, :string
    change_column :users, :dependency_name, :string
    change_column :users, :full_name, :string
  end

  def down
    change_column :users, :government_type, :text
    change_column :users, :state, :text
    change_column :users, :municipality, :text
    change_column :users, :deputation, :text
    change_column :users, :dependency_name, :text
    change_column :users, :full_name, :text
  end
end
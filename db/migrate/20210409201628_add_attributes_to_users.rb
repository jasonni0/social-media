class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_admin, :boolean, :default => false
    add_column :users, :is_public, :boolean, :default => false
  end
end

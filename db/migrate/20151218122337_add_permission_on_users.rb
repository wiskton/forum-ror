class AddPermissionOnUsers < ActiveRecord::Migration
  def change
    add_column :users, :permission, :integer
  end
end

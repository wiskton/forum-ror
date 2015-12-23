class ChangeBlockFieldOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :block, :boolean
  end
end

class AddBlockFieldOnUsers < ActiveRecord::Migration
  def change
    add_column :users, :block, :integer
  end
end

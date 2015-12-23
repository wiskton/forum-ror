class AddColumnLoggedOnPosts < ActiveRecord::Migration
  def change
    add_column :posts, :logged, :boolean
  end
end

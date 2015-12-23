class DelColumnOnPosts < ActiveRecord::Migration
  def change
      remove_column :posts, :created
      remove_column :posts, :updated
  end
end

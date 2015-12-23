class AddPostIdOnComments2 < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer
  end
end

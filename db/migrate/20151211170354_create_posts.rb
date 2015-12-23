class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.integer :views
      t.integer :user_id
      t.datetime :created
      t.datetime :updated
      t.timestamps null: false
    end
  end
end

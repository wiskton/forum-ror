class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :category_id
      t.integer :topic_id, null: true
      t.text :description
      t.datetime :created
      t.datetime :updated
      t.timestamps null: false
    end
  end
end

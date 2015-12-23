class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.datetime :created
      t.datetime :updated
      t.timestamps null: false
    end
  end
end

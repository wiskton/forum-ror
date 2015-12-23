class DelColumnOnCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :created
    remove_column :categories, :updated
  end
end

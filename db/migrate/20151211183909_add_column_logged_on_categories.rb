class AddColumnLoggedOnCategories < ActiveRecord::Migration
  def change
    add_column :categories, :logged, :boolean
  end
end

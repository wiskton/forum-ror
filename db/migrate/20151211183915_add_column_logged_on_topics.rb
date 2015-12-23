class AddColumnLoggedOnTopics < ActiveRecord::Migration
  def change
    add_column :topics, :logged, :boolean
  end
end

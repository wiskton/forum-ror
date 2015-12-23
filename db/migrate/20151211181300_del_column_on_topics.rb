class DelColumnOnTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :created
    remove_column :topics, :updated
  end
end

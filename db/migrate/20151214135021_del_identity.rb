class DelIdentity < ActiveRecord::Migration
  def change
    drop_table :identities
  end
end

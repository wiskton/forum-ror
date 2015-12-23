class CreateOnlyAuthorsAuthorizations < ActiveRecord::Migration
  def change
    create_table :only_authors_authorizations do |t|

      t.timestamps null: false
    end
  end
end

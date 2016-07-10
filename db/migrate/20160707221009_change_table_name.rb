class ChangeTableName < ActiveRecord::Migration
  def change
  	rename_table :new_users, :users
  end
end

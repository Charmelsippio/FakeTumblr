class CreateNewUsers < ActiveRecord::Migration
  def change
    create_table :new_users do |t|
    	t.string :name
    	t.string :email
    	t.string :username
    	t.string :password

      t.timestamps null: false
    end
  end
end

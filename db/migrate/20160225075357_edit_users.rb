class EditUsers < ActiveRecord::Migration
  def change

  	drop_table :users

  	create_table :users do |t|
  		t.string :name
  		t.string :user_name
  		t.string :password_digest
  	end
  end
end

class AddUsers < ActiveRecord::Migration
  def change
  	create_table :users, id: false do |t|
  		t.uuid :id, primary_key: true
  		t.string :name
  		t.string :user_name
  		t.string :password_digest
  	end
  end
end

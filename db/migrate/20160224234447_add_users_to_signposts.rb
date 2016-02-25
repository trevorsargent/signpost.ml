class AddUsersToSignposts < ActiveRecord::Migration
  def change
  	change_table :signposts do |t|
  		t.integer :user_id
  	end
  end
end

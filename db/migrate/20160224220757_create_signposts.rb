class CreateSignposts < ActiveRecord::Migration
  def change
  	create_table :signposts do |t| 
  		t.string :headline
  		t.string :message
  	end
  end
end

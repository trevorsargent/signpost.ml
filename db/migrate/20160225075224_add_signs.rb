class AddSigns < ActiveRecord::Migration
  def change
  	create_table :signs do |t| 
  		t.integer :post_id
  		t.integer :user_id
		t.text :message
		t.integer :type
		t.datetime :created_at
  	end
  end
end

class AddPosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t| 
		t.string :title
		t.decimal :latitude
		t.decimal :longitude
		t.boolean :visible
		t.datetime :created_at
  	end
  end
end

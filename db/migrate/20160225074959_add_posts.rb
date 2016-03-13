class AddPosts < ActiveRecord::Migration
  def change
  	create_table :posts, id: false do |t| 
  		t.uuid :id, primary_key: true
		t.string :title
		t.decimal :latitude
		t.decimal :longitude
		t.boolean :visible
		t.datetime :created_at
  	end
  end
end

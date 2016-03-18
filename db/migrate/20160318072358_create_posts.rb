class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts, id: false do |t|
  		t.uuid :id, primary_key: true
  		t.string :title
		t.decimal :lat
		t.decimal :long
		t.datetime :created_at
		t.boolean :visible  	
  		
  	end
  end
end

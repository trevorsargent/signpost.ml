class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  	t.string :title
		t.decimal :lat
		t.decimal :long
		t.datetime :created_at
		t.boolean :visible  	
  		
  	end
  end
end

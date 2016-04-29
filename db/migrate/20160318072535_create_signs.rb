class CreateSigns < ActiveRecord::Migration
  def change
  	create_table :signs do |t|
  		t.integer :post_id
  		t.integer :user_id
  		t.string :message
  		t.integer :type_label
  	end
  end
end

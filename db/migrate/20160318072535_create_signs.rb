class CreateSigns < ActiveRecord::Migration
  def change
  	create_table :signs, id: false do |t|
  		t.uuid :id, primary_key: true
  		# t.uuid :post_id
  		# t.uuid :user_id
  		t.string :message
  		t.integer :type_label
  		t.string :password_digest
  	end
  end
end

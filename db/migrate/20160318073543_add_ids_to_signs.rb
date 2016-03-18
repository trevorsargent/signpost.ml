class AddIdsToSigns < ActiveRecord::Migration
  def change
  	add_column :signs, :user_id, :uuid
  	add_column :signs, :post_id, :uuid
  end
end

class AddCreatedAtToSigns < ActiveRecord::Migration
  def change
  	add_column :signs, :created_at, :datetime
  end
end

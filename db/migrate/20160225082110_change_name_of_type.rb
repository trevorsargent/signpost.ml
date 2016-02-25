class ChangeNameOfType < ActiveRecord::Migration
  def change
  	change_table :signs do |t|

  		remove_column :signs,  :type
  		t.integer :type_label
  	end
  end
end

class DropSignposts < ActiveRecord::Migration
  def change
  	drop_table :signposts
  end
end

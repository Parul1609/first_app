class DropMicroposts2 < ActiveRecord::Migration
  def change
  	drop_table :microposts
  end
end

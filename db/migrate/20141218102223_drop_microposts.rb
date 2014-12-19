class DropMicroposts < ActiveRecord::Migration
  def change
  	drop_table :microposts
  end
  # def down
  #   raise ActiveRecord::IrreversibleMigration
  # end

end

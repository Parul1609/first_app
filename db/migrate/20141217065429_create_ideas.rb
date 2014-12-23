class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.text :description
      t.string :picture

      t.timestamps null: false
    end
  end
end

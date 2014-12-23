class CreateFriendsUsers < ActiveRecord::Migration
  def change
    create_table :friends_users do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end

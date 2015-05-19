class CreateFollowings < ActiveRecord::Migration
  def self.up
    create_table :followings, id: false do |t|
      t.integer :user_id
      t.integer :following_user_id
    end

    add_index(:followings, [:user_id, :following_user_id], :unique => true)
    add_index(:followings, [:following_user_id, :user_id], :unique => true)
  end

  def self.down
    remove_index(:followings, [:following_user_id, :user_id])
    remove_index(:followings, [:user_id, :following_user_id])
    drop_table :followings
  end
end

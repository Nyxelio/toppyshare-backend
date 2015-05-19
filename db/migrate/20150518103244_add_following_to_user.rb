class AddFollowingToUser < ActiveRecord::Migration
  def change
    add_reference :users, :following, index: true, foreign_key: true
  end
end

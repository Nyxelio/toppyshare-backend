class AddForkedTopIdToTops < ActiveRecord::Migration
  def change
    add_column :tops, :forked_top_id, :integer, null: true
  end
end

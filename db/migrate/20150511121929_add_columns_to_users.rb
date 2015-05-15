class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lang, :string
    add_column :users, :country, :string
    add_column :users, :categories, :text
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :mail
      t.string :lang
      t.string :country
      t.text :categories

      t.timestamps null: false
    end
  end
end

class CreateTops < ActiveRecord::Migration
  def change
    create_table :tops do |t|
      t.string :title
      t.text :tags
      t.string :category
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

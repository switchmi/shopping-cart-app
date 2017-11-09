class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false
      t.string :feature
      t.integer :price, null: false
      t.integer :stock, null: false
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end

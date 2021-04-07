class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :quantity
      t.integer :user_id

      t.timestamps
    end
    add_index :products, :user_id
  end
end

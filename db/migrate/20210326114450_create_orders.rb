class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :user_id
      t.integer :address_id

      t.timestamps
    end
  end
end

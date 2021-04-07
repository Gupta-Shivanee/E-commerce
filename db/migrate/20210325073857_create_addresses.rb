class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :house_no
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode
      t.integer :user_id

      t.timestamps
    end
  end
end

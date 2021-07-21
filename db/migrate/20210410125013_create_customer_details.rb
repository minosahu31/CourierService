class CreateCustomerDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_details do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.integer :pincode
      t.string :email

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :parcel_weight
      t.string :payment_mode
      t.string :service_type
      t.integer :cost_of_service
      t.string :status
      t.integer :user_id
      t.integer :uniq_order_id
      t.integer :sender_id 
      t.integer :receiver_id 

      t.timestamps
    end
  end
end

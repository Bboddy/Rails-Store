class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :address
      t.decimal :total_price
      t.string :shipping_time
      t.string :status

      t.timestamps
    end
  end
end

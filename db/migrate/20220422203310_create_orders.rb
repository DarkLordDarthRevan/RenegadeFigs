class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :products
      t.decimal :total
      t.string :address
      t.string :province

      t.timestamps
    end
  end
end

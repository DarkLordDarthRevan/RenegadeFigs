class CreateRenegadefigs < ActiveRecord::Migration[7.0]
  def change

    create_table :renegadefigs do |t|
      t.string :productName
      t.text :description
      t.decimal :price
      t.integer :stock
      t.string :productImage
      t.timestamp :dateAdded

      t.timestamps
    end
  end
end

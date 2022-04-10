class AddDescriptionToRenegadefigs < ActiveRecord::Migration[7.0]
  def change
    add_column :renegadefigs, :category, :string
  end
end

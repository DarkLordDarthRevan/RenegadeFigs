class Updatename < ActiveRecord::Migration[7.0]
  def change
    rename_column :renegadefigs, :catergory, :category
  end
end

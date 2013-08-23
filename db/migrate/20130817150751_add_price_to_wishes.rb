class AddPriceToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :price, :string
  end
end

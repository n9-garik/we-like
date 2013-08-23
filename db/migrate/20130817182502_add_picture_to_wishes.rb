class AddPictureToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :picture, :string
  end
end

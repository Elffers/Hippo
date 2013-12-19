class ChangePhotoType < ActiveRecord::Migration
  def change
    change_column :products, :photo, :string
  end
end

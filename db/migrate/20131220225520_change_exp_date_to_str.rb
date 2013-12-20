class ChangeExpDateToStr < ActiveRecord::Migration
  def change
    change_column :purchase_infos, :expiration_date, :string
  end
end

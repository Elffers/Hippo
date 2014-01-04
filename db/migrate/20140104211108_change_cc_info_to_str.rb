class ChangeCcInfoToStr < ActiveRecord::Migration
  def change
    change_column :purchase_infos, :credit_card_number, :string
    change_column :purchase_infos, :cvv, :string
  end
end

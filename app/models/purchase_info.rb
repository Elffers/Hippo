class PurchaseInfo < ActiveRecord::Base
  validates  :first_name, presence: true
  validates  :last_name, presence: true
  validates  :address, presence: true
  validates  :city, presence: true
  validates  :state, presence: true
  validates  :zip_code, presence: true, format: { with: /\d{5}/ }
  validates  :billing_first, presence: true
  validates  :billing_last, presence: true
  validates  :credit_card_number, format: { with: /\d{16}/ }
  validates  :expiration_date, presence: true, format: { with: /\d+\/\d+/ }
  validates  :cvv, presence: true, format: { with: /\d{3}/ }
  validates  :billing_address, presence: true
  validates  :billing_city, presence: true
  validates  :billing_state, presence: true
  validates  :billing_zip_code, presence: true, format: { with: /\d{5}/ }
  belongs_to :order
end

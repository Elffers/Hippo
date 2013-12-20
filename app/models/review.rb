class Review < ActiveRecord::Base
  validates :rating, presence: true, numericality: { less_than_or_equal_to: 5 }
  validates :description, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true}

  belongs_to :product
  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :products
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

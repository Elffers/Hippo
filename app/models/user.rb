class User < ActiveRecord::Base
  # attr_accessor :email, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :products

end

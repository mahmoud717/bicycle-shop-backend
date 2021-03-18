class User < ApplicationRecord
  has_secure_password
  has_many :favourites
  has_many :bicycles, through: :favourites, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: ConstantData::VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { minimum: 3 }
  validates :password, presence: :true, length: { minimum: 6 }
  
end

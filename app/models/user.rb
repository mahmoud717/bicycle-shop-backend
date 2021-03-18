class User < ApplicationRecord
  has_secure_password
  has_many :favourites
  has_many :bicycles, through: :favourites, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :name, presence: true, length: { minimum: 3 }
  validates_format_of :email,
                      with: /\A\S+@.+\.\S+\z/
  
end

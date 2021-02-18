class User < ApplicationRecord
  has_many :favourites
  has_many :bicycles, through: :favourites
  has_many :orders

  validates :name, presence: true, length: { minimum: 3 }
  validates_format_of :email,
                      with: /\A\S+@.+\.\S+\z/
end

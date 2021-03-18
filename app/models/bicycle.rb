class Bicycle < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites
  has_many :orders, :dependent => :destroy
  has_many :options, :dependent => :destroy
end

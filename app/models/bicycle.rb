class Bicycle < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites
  has_many :master_options
end

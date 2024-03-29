class Bicycle < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites
  has_many :orders, dependent: :destroy
  has_many :options, dependent: :destroy

  validates :name, presence: true
  validates :model, presence: true
  validates :image_url, presence: true
  validates :description, presence: true
end

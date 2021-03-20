class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle

  validates :product_name, presence: true
  validates :product_image_url, presence: true
  validates :options, presence: true
end

FactoryBot.define do
  factory :order do
    product_name { 'some name' }
    product_image_url { 'somepassword' }
    options { { name: 'order' } }
    user
    bicycle
  end
end

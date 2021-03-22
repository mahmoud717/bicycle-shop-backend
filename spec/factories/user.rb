require 'faker'
FactoryBot.define do
  factory :user do
    name { 'mahmoud' }
    email { Faker::Internet.email }
    image_url { 'asdasfafgag' }
    password { 'somepassword' }
    password_confirmation { 'somepassword' }
  end
end

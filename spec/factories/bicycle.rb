FactoryBot.define do
  factory :bicycle do
    name { 'bike 1' }
    model { 'bike' }
    image_url { 'someurl' }
    description { 'some des' }
  end
end

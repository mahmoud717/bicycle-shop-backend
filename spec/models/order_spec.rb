require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:product_name) }
    it { should validate_presence_of(:product_image_url) }
    it { should validate_presence_of(:options) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:bicycle) }
  end
end

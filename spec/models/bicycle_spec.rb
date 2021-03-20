require 'rails_helper'

RSpec.describe Bicycle, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should have_many(:favourites) }
    it { should have_many(:orders) }
    it { should have_many(:users) }
    it { should have_many(:options) }
  end
end

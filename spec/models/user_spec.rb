require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:name) }
    it { should validate_length_of(:password) }
    it { should have_secure_password }
  end

  describe 'associations' do
    it { should have_many(:bicycles) }
    it { should have_many(:favourites) }
    it { should have_many(:orders) }
  end
end

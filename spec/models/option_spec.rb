require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:value) }
  end

  describe 'associations' do
    it { should have_many(:suboptions).class_name('Option') }
    it { should belong_to(:bicycle) }
  end
end

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:technologies) }
    it { should validate_presence_of(:github_link) }
    it { should validate_presence_of(:deploy_link) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one_attached(:image) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:project)).to be_valid
    end
  end
end 
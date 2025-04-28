require 'rails_helper'

RSpec.describe Experience, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:experience)).to be_valid
    end
  end

  describe 'scopes' do
    describe '.ordered' do
      let!(:experience1) { create(:experience, start_date: 1.year.ago) }
      let!(:experience2) { create(:experience, start_date: 2.years.ago) }
      let!(:experience3) { create(:experience, start_date: 3.years.ago) }

      it 'returns experiences ordered by start_date in descending order' do
        expect(Experience.ordered).to eq([experience1, experience2, experience3])
      end
    end
  end
end 
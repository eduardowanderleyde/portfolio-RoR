require 'rails_helper'

RSpec.describe ContactMessage, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:message) }
    it { should validate_length_of(:message).is_at_least(10) }
    
    it "should validate email format" do
      contact = ContactMessage.new(
        name: "John Doe",
        email: "invalid-email",
        subject: "Test",
        message: "This is a test message"
      )
      expect(contact).not_to be_valid
      expect(contact.errors[:email]).to include("is invalid")
    end
  end

  describe "factory" do
    it "has a valid factory" do
      expect(build(:contact_message)).to be_valid
    end
  end
end

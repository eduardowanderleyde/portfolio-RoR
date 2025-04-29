require 'rails_helper'

RSpec.describe "ContactMessages", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/contact_messages/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) {
      {
        contact_message: {
          name: "John Doe",
          email: "john@example.com",
          subject: "Test Subject",
          message: "This is a test message"
        }
      }
    }

    it "creates a new contact message" do
      expect {
        post "/contact_messages", params: valid_attributes
      }.to change(ContactMessage, :count).by(1)
    end

    it "redirects to the root path" do
      post "/contact_messages", params: valid_attributes
      expect(response).to redirect_to(root_path)
    end
  end
end

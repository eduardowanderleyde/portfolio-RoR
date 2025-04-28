require 'rails_helper'

RSpec.describe "ContactMessages", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/contact_messages/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/contact_messages/create"
      expect(response).to have_http_status(:success)
    end
  end

end

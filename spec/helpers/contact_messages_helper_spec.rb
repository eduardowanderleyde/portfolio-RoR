require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ContactMessagesHelper. For example:
#
# describe ContactMessagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ContactMessagesHelper, type: :helper do
  describe "contact_message_form_title" do
    it "returns the correct title" do
      expect(helper.contact_message_form_title).to eq("Entre em Contato")
    end
  end
end

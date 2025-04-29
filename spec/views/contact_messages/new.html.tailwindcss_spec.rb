require 'rails_helper'

RSpec.describe "contact_messages/new", type: :view do
  before(:each) do
    assign(:contact_message, ContactMessage.new)
    render
  end

  it "renders the contact form" do
    assert_select "form[action=?][method=?]", contact_messages_path, "post" do
      assert_select "input[name=?]", "contact_message[name]"
      assert_select "input[name=?]", "contact_message[email]"
      assert_select "input[name=?]", "contact_message[subject]"
      assert_select "textarea[name=?]", "contact_message[message]"
    end
  end

  it "displays the form title" do
    expect(rendered).to match(/Entre em Contato/)
  end
end

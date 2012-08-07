require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :name => "MyString",
      :email => "MyString",
      :text => "MyText",
      :company_name => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :project_description => "MyText",
      :deadline => "MyString",
      :budget => "MyString",
      :comment => "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_name", :name => "message[name]"
      assert_select "input#message_email", :name => "message[email]"
      assert_select "textarea#message_text", :name => "message[text]"
      assert_select "input#message_company_name", :name => "message[company_name]"
      assert_select "input#message_country", :name => "message[country]"
      assert_select "input#message_phone", :name => "message[phone]"
      assert_select "textarea#message_project_description", :name => "message[project_description]"
      assert_select "input#message_deadline", :name => "message[deadline]"
      assert_select "input#message_budget", :name => "message[budget]"
      assert_select "textarea#message_comment", :name => "message[comment]"
    end
  end
end

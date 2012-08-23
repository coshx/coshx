require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :name => "Name",
      :email => "Email",
      :text => "MyText",
      :company_name => "Company Name",
      :country => "Country",
      :phone => "Phone",
      :project_description => "MyText",
      :deadline => "Deadline",
      :budget => "Budget",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/Company Name/)
    rendered.should match(/Country/)
    rendered.should match(/Phone/)
    rendered.should match(/MyText/)
    rendered.should match(/Deadline/)
    rendered.should match(/Budget/)
    rendered.should match(/MyText/)
  end
end

require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
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
      ),
      stub_model(Message,
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
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Deadline".to_s, :count => 2
    assert_select "tr>td", :text => "Budget".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

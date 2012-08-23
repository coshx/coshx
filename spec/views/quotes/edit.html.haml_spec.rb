require 'spec_helper'

describe "quotes/edit" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :text => "MyString",
      :author => "MyString",
      :project_id => 1
    ))
  end

  it "renders the edit quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quotes_path(@quote), :method => "post" do
      assert_select "input#quote_text", :name => "quote[text]"
      assert_select "input#quote_author", :name => "quote[author]"
      assert_select "input#quote_project_id", :name => "quote[project_id]"
    end
  end
end

require 'spec_helper'

describe "contents/edit" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :action => "MyString",
      :welcome => 1,
      :value => "MyText"
    ))
  end

  it "renders the edit content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contents_path(@content), :method => "post" do
      assert_select "input#content_action", :name => "content[action]"
      assert_select "input#content_index", :name => "content[welcome]"
      assert_select "textarea#content_value", :name => "content[value]"
    end
  end
end

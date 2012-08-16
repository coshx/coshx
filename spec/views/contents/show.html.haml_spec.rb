require 'spec_helper'

describe "contents/show" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :action => "Action",
      :index => 1,
      :value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Action/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end

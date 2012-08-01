require 'spec_helper'

describe "quotes/show" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :text => "Text",
      :author => "Author",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    rendered.should match(/Author/)
    rendered.should match(/1/)
  end
end

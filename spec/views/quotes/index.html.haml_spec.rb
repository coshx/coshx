require 'spec_helper'

describe "quotes/welcome" do
  before(:each) do
    assign(:quotes, [
      stub_model(Quote,
        :text => "Text",
        :author => "Author",
        :project_id => 1
      ),
      stub_model(Quote,
        :text => "Text",
        :author => "Author",
        :project_id => 1
      )
    ])
  end

  it "renders a list of quotes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

require 'spec_helper'

describe "featured_projects/show" do
  before(:each) do
    @featured_project = assign(:featured_project, stub_model(FeaturedProject,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end

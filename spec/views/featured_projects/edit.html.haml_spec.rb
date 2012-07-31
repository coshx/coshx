require 'spec_helper'

describe "featured_projects/edit" do
  before(:each) do
    @featured_project = assign(:featured_project, stub_model(FeaturedProject,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit featured_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => featured_projects_path(@featured_project), :method => "post" do
      assert_select "input#featured_project_title", :name => "featured_project[title]"
      assert_select "textarea#featured_project_description", :name => "featured_project[description]"
    end
  end
end

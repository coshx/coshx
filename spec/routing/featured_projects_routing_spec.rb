require "spec_helper"

describe FeaturedProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/featured_projects").should route_to("featured_projects#index")
    end

    it "routes to #new" do
      get("/featured_projects/new").should route_to("featured_projects#new")
    end

    it "routes to #show" do
      get("/featured_projects/1").should route_to("featured_projects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/featured_projects/1/edit").should route_to("featured_projects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/featured_projects").should route_to("featured_projects#create")
    end

    it "routes to #update" do
      put("/featured_projects/1").should route_to("featured_projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/featured_projects/1").should route_to("featured_projects#destroy", :id => "1")
    end

  end
end

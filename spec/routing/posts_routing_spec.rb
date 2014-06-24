require "spec_helper"

describe PostsController do
  describe "routing" do

    it "routes to #index" do
      get("/blog").should route_to("posts#index")
    end

    it "routes to #index (with date)" do
      get("/blog/2014/04/19").should route_to("posts#index", :year => "2014", :month => "04", :day => "19")
    end

    it "routes to #index (with author)" do
      get("/blog/author/joshua_angeley").should route_to("posts#index", :author_slug => "joshua_angeley")
    end

    # it "routes to #show (with date and title)" do
    #   get("/blog/2014/04/19/Joshua-Birthday").should route_to("posts#show", :year => "2014", :month => "04", :day => "19", :title => "Joshua-Birthday")
    # end

    it "routes to #show (with google seo title)" do
      get("/blog/Joshua-Birthday").should route_to("posts#show", :seo_title => "Joshua-Birthday")
    end

    it "routes to #new" do
      get("/posts/new").should route_to("posts#new")
    end

    it "routes to #show" do
      get("/posts/1").should route_to("posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/posts/1/edit").should route_to("posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/posts").should route_to("posts#create")
    end

    it "routes to #update" do
      put("/posts/1").should route_to("posts#update", :id => "1")
    end

    # it "routes to #destroy" do
    #   delete("/posts/1").should route_to("posts#destroy", :id => "1")
    # end

    it "routes to #publish" do
      put("/posts/1/publish").should route_to("posts#publish", :id => "1")
    end

  end
end

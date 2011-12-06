require 'spec_helper'

describe PostsController do
  describe "feed" do
    it "renders posts in atom format" do
      get :feed, :format => :atom
      assigns(:posts)
    end
  end
end

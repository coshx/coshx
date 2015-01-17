require 'spec_helper'

describe PagesController do

  describe "GET robots" do
    context "ENV[DISABLE_ROBOTS] is false" do
      before do
        # ENV.stub(:["DISABLE_ROBOTS"]).with("DISABLE_ROBOTS").and_return("false")
        stub_const('ENV', {'DISABLE_ROBOTS' => 'false'})
      end

      it "doesn't contain 'Disallow: /'" do
        get :robots
        response.body.should_not match(/Disallow/)
      end
    end

    context "ENV[DISABLE_ROBOTS] is true" do
      before do
        ENV.stub(:[]).with("DISABLE_ROBOTS").and_return("true")
      end

      it "contains Disallow: /" do
        get :robots
        response.body.should match(/Disallow: \//)
      end
    end
  end

end

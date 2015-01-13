require 'spec_helper'

describe PagesController do

  describe "GET :services" do
    it "queries for services" do
      get :services
      services = assigns :services
      services.to_sql.should == %q(SELECT "services".* FROM "services"  ORDER BY "services"."sort_order" ASC)
    end
  end

  describe "GET :about" do
    it "queries for team members" do
      get :about
      admins = assigns :team
      admins.to_sql.should == %q(SELECT "admins".* FROM "admins" WHERE "admins"."deleted_at" IS NULL AND "admins"."alumni" = 'f'  ORDER BY "admins"."last_name" ASC)
    end

    it "queries for alumni" do
      get :about
      admins = assigns :alumni
      admins.to_sql.should == %q(SELECT "admins".* FROM "admins" WHERE "admins"."deleted_at" IS NULL AND "admins"."alumni" = 't'  ORDER BY "admins"."last_name" ASC)
    end
  end

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

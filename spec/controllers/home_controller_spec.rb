require 'spec_helper'

describe HomeController do

  describe "GET :services" do
    it "queries for services" do
      get :services
      services = assigns :services
      services.to_sql.should == 'SELECT "services".* FROM "services"  ORDER BY sort_order'
    end
  end

  describe "GET :about" do
    it "queries for admins" do
      get :about
      admins = assigns :coshx_folks
      admins.to_sql.should == 'SELECT "admins".* FROM "admins"  WHERE "admins"."deleted_at" IS NULL ORDER BY name'
    end
  end

end

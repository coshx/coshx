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
      admins.to_sql.should == 'SELECT "admins".* FROM "admins"  ORDER BY name'
    end
  end

  describe "GET :portfolio" do
    let(:all) { [mock_model(Client), mock_model(Client)] }

    it "retrieves all clients, shuffled" do
      Client.should_receive(:all).and_return all
      all.should_receive(:shuffle).and_return all

      get :portfolio
      assigns(:clients).should == all
    end
  end

end

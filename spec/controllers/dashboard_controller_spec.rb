require 'spec_helper'

describe DashboardController do

  describe "GET :index" do

    context "signed in" do
      before(:each) do
        sign_in create(:admin)
        get :index
      end

      it { should respond_with :success }
    end

    context "not signed in" do
      before(:each) { get :index }

      it { should respond_with :redirect }
    end
  end
end

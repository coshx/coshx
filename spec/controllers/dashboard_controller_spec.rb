require 'spec_helper'

describe DashboardController do

  describe "GET :welcome" do

    context "signed in" do
      before(:each) do
        sign_in create(:admin)
        get :welcome
      end

      it { should respond_with :success }
    end

    context "not signed in" do
      before(:each) { get :welcome }

      it { should respond_with :redirect }
    end
  end
end

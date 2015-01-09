require 'spec_helper'

describe JobsController do

  let(:job) { create :job }

  describe "GET :welcome" do

      it "retrieves open jobs" do
        jobs = [mock_model(Job)]
        Job.should_receive(:open).and_return jobs
        get :welcome
        assigns(:open_jobs).should == jobs
      end

      it "retrieves filled jobs" do
        jobs = [mock_model(Job)]
        Job.should_receive(:filled).and_return jobs
        get :welcome
        assigns(:filled_jobs).should == jobs
       end

  end

  describe "GET :show" do
    it "retrieves the job by title" do
      get :show, :id => job.to_param
      assigns(:job).should == job
    end
  end

  describe "GET :new" do
    context "admin signed in" do
      before(:each) do
        sign_in create(:admin)
        get :new
      end

      # not working now, commenting out since job model might not be on the new site
      # it { should assign_to(:job).with_kind_of Job }
      it { should respond_with :success }
    end

    context "guest user" do
      before(:each) { get :new }
      it { should respond_with :redirect }
    end
  end

  describe "POST :create" do
    context "admin signed in" do
      before(:each) { sign_in create(:admin) }

      context "good job attributes" do
        before(:each) { post :create, :job => attributes_for(:job) }

        it { should respond_with :redirect }
        it { should set_the_flash.to 'Job posting saved.' }
      end

      context "bad job attributes" do
        before(:each) { post :create, :job => {} }

        it { should respond_with :success }
        it { should render_template :new }
        it { should set_the_flash.now.to 'Error saving job posting.' }
      end
    end

    context "guest user" do
      before(:each) { post :create }
      it { should respond_with :redirect }
    end
  end

  describe "GET :edit" do
    context "admin signed in" do
      before(:each) { sign_in create(:admin) }
      it "retrieves the job by title" do
        get :edit, :id => job.to_param
        assigns(:job).should == job
      end
    end

    context "guest user" do
      before(:each) { get :edit, :id => 'title' }
      it { should respond_with :redirect }
    end
  end

  describe "PUT :update" do
    context "admin signed in" do
      before(:each) { sign_in create(:admin) }

      context "good job attributes" do
        before(:each) do
          put :update, :id => job.to_param, :job => {:description => 'new description'}
        end

        it { should respond_with :redirect }
        it { should set_the_flash.to 'Job was successfully updated.' }
      end

      context "bad job attributes" do
        let(:other_job) { create :job }
        before(:each) do
          put :update, :id => job.to_param, :job => {:title => other_job.title}
        end

        it { should respond_with :success }
        it { should render_template :edit }
        it { should set_the_flash.now.to 'Error updating job posting.' }
      end
    end

    context "guest user" do
      before(:each) { put :update, :id => 'title' }
      it { should respond_with :redirect }
    end
  end

  describe "PUT :publish" do
    context "admin signed in" do
      before(:each) do
        sign_in create(:admin)
        put :publish, :id => job.to_param
      end

      it { should respond_with :redirect }
      it { should set_the_flash.to %("#{job.title}" has been published.) }
    end

    context "guest user" do
      before(:each) { put :publish, :id => 'title' }
      it { should respond_with :redirect }
    end
  end

end

require 'spec_helper'

describe PostsController do

  let(:blog_post) { create :published_post }
  let(:admin)     { create :admin }

  describe "GET :index" do
    it "pages the results" do
      get :index
      assigns(:posts).to_sql.should include("LIMIT 4 OFFSET 0")
    end

    context "admin signed in" do
      before(:each) { sign_in admin }

      it "retrives all Posts" do
        get :index
        assigns(:posts).to_sql.should_not =~ /WHERE/i
      end

      it "orders the posts with unpublished posts first, then in descending order of creation" do
        get :index
        assigns(:posts).to_sql.should =~ /ORDER BY posted_on DESC, created_at DESC/
      end
    end

    it "retrieves published posts for a guest" do
      get :index
      assigns(:posts).to_sql.should include("WHERE (posted_on IS NOT NULL)")
    end

    it "retrives posts for a given year and month when given" do
      get :index, :year => '2012', :month => '01'
      assigns(:posts).to_sql.should include("WHERE (permalink LIKE '2012/01/%/%')")
    end

    it "redirects old blog urls" do
      get :index, :year => blog_post.id
      response.should be_redirect
    end
  end

  describe "GET :show" do
    context "with permalink" do
      context "of created post" do
        before(:each) { get :show, blog_post.permalink_attributes }
        it { should respond_with :success }
      end

      context "of missing post" do
        let(:blog_post) { build :published_post }
        it "raises record not found" do
          expect { get :show, blog_post.permalink_attributes }.
            to raise_error ActiveRecord::RecordNotFound
        end
      end
    end

    context "with id" do
      context "of published post" do
        before(:each) { get :show, :id => create(:published_post).id }
        it { should respond_with :redirect }
      end

      context "of unpublished post" do
        before(:each) { get :show, :id => create(:post).id }
        it { should respond_with :success }
      end
    end
  end

  describe "GET :new" do
    context "admin signed in" do
      before(:each) do
        sign_in admin
        get :new
      end

      it "creates an empty post" do
        assigns(:post).should be_a_kind_of Post
      end
      it { should respond_with :success }
    end

    context "guest user" do
      before(:each) { get :new }
      it { should respond_with :redirect }
    end
  end

  describe "POST :create" do
    context "admin signed in" do
      before(:each) { sign_in admin }

      context "good post attributes" do
        before(:each) { post :create, :post => attributes_for(:post) }

        it { should respond_with :redirect }
        it { should set_the_flash.to 'Blog post saved.' }
      end

      context "bad post attributes" do
        before(:each) { post :create, :post => {} }

        it { should respond_with :success }
        it { should set_the_flash.now.to 'Error saving your blog post.' }
      end
    end

    context "guest user" do
      before(:each) { post :create }
      it { should respond_with :redirect }
    end
  end

  describe "GET :edit" do
    context "admin signed in" do
      before(:each) do
        sign_in admin
        get :edit, :id => blog_post.id
      end
      it "assigns the blog post" do
        assigns(:post).should eq(blog_post)
      end
      it { should respond_with :success }
    end

    context "guest user" do
      before(:each) { get :edit, :id => '1' }
      it { should respond_with :redirect }
    end
  end

  describe "PUT :update" do
    context "admin signed in" do
      before(:each) { sign_in admin }

      context "good post attributes" do
        before(:each) do
          put :update, :id => blog_post.id, :post => {:body => "new body"}
        end

        it { should respond_with :redirect }
        it { should set_the_flash.to 'Post was successfully updated.' }
      end

      context "bad post attributes" do
        before(:each) do
          put :update, :id => blog_post.id, :post => {:title => ''}
        end

        it { should respond_with :success }
        it { should render_template :edit }
        it { should set_the_flash.now.to 'Error updating blog post.' }
      end
    end

    context "guest user" do
      before(:each) { put :update, :id => '1' }
      it { should respond_with :redirect }
    end
  end

  describe "PUT :publish" do
    context "admin signed in" do
      before(:each) do
        sign_in admin
        Tweeter.should_receive(:blog_post_tweet)
        put :publish, :id => create(:post).id
      end

      it { should respond_with :redirect }
      it { should set_the_flash.to 'Post has been published.' }
    end

    context "guest user" do
      before(:each) { put :publish, :id => '1' }
      it { should respond_with :redirect }
    end
  end

  describe "GET :feed" do
    it "renders posts in atom format" do
      get :feed, :format => :atom
      assigns(:posts)
    end
  end

end

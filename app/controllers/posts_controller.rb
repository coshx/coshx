class PostsController < ApplicationController
  prepend_before_filter :authenticate_admin!, :except => [:index, :show, :feed]
  before_filter :redirect_old_post_url, :only => :show

  def index
    if admin_signed_in?
      @posts = Post.all
    else
      @posts = Post.select { |p| p.published? }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    post = Post.new(:author => current_admin, :title => params[:post][:title], :body => params[:post][:body])

    respond_to do |format|
      if post.save
        format.html { redirect_to admin_root_path, notice: 'Blog post saved' }
      else
        format.html { redirect_to admin_root_path, error: 'Error saving blog post.' }
      end
    end
  end

  def show
    @post ||= Post.where(:permalink => Post.build_permalink(params)).first
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def publish
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.publish && @post.save
        format.html { redirect_to :action => "index", :notice => 'Post has been published' }
      else
        format.html { redirect_to :action => "index" }
      end
    end
  end

  def feed
    @feed_url = feed_url
    @posts = Post.select { |p| p.published? }
  end

  private

  def redirect_old_post_url
    if params[:id].present?
      @post = Post.find params[:id]
      if @post.published?
        redirect_to show_posts_path(@post.permalink_attributes), :status => :moved_permanently
      end
    end
  end
end

class PostsController < ApplicationController

  prepend_before_filter :authenticate_admin!, :except => [:index, :show, :feed]
  before_filter :redirect_old_blog_url, :only => :index
  before_filter :redirect_published_posts, :only => :show

  def index
    @body_class = :split
    @posts = if params[:year].present?
               Post.where("permalink LIKE '#{Post.build_like_permalink params}'")
             elsif params[:author_id].present?
               Post.published.where(:author_id => params[:author_id])
             elsif admin_signed_in?
               Post.scoped.order("posted_on DESC").order("created_at DESC")
             else
               Post.published.by_author_slug(params[:author_slug])
             end.page(params[:page]).per(4)
    @display_author_info = params[:author_slug].present?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(:author => current_admin, :title => params[:post][:title],  :body => params[:post][:body])
    
    # if @post.seo_title.nil?
    #   @post.seo_title = @post.title
    # end

    if @post.save
      redirect_to admin_root_path, notice: 'Blog post saved.'
    else
      flash.now[:alert] = 'Error saving your blog post.'
      render :new
    end
  end

  def show
    # @post ||= Post.where(:permalink => Post.build_permalink(params)).first
    @post ||= Post.where(:permalink => Post.build_seo_permalink(params)).first
    
    raise ActiveRecord::RecordNotFound if @post.nil?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # if @post.seo_title.nil?
    #   @post.seo_title = @post.title
    # end
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      flash.now[:alert] = 'Error updating blog post.'
      render :edit
    end
  end

  def publish
    @post = Post.find(params[:id])
    if @post.publish && @post.save
      redirect_to @post, notice: 'Post has been published.'
    else
      redirect_to blog_posts_path, alert: %(Could not publish "#{@post.title}".)
    end
  end

  def feed
    @title = "Coshx Labs Blog"
    @feed_url = feed_url
    @posts = Post.published
  end

  private

  def redirect_old_blog_url
    if params[:year].present? && params[:year].to_i < 1000
      @post = Post.find params[:year]
      if @post.published?
        # redirect_to show_post_path(@post.permalink_attributes), :status => :moved_permanently
        redirect_to show_post_path(@post.seo_permalink_attributes), :status => :moved_permanently
      else
        redirect_to @post, :status => :moved_permanently
      end
    end
  end

  def redirect_published_posts
    if params[:id].present?
      @post = Post.find params[:id]
      if @post.published?
        # redirect_to show_post_path(@post.permalink_attributes), :status => :moved_permanently
        redirect_to show_post_path(@post.seo_permalink_attributes)#, :status => :moved_permanently
      end
    end
  end
end

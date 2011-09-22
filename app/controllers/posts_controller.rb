class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    post = Post.new(:author => current_admin, :title => params[:post][:title], :body => params[:post][:body])
    post.date = DateTime.now

    respond_to do |format|
      if post.save
        format.html { redirect_to admin_root_path, notice: 'Blog post saved' }
      else
        format.html { redirect_to admin_root_path, error: 'Error saving blog post.' }
      end
    end
  end
end

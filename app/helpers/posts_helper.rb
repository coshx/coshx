module PostsHelper

  def blog_post_path(post)
    if post.published?
      show_post_path post.permalink_attributes
    else
      post_path post
    end
  end
end

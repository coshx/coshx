module PostsHelper

  def blog_post_path(post)
    if post.published?
      show_post_path post.permalink_attributes
    else
      post_path post
    end
  end

def coderay(text)
  text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
    CodeRay.scan($3, $2).html
  end
end



end

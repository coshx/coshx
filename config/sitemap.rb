#Don't ping seo engines:
  #rake sitemap:refresh:no_ping
#Refresh and ping seo engines:
  #rake sitemap:refresh

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.coshx.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap welcome file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  
  add about_path, :changefreq => 'weekly', :priority => 0.7
  add projects_path, :changefreq => 'weekly', :priority => 0.7
  add blog_posts_path, :changefreq => 'weekly', :priority => 0.7
  add careers_path, :changefreq => 'monthly', :priority => 0.4
  add contact_path, :changefreq => 'monthly', :priority => 0.4
end

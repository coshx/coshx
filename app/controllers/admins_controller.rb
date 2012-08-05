class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  
  def generate_slugs
    slugs = ''
    Admin.all.each do |a|
      #a.generate_slug
      a.save!
      slugs = slugs + a.slug + "<br>";
    end
      
    render :text => slugs.html_safe + '<br>Slugs were generated'.html_safe
  end
  
end

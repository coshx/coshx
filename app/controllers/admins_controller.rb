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
  
  
   def update
    @folk = current_admin
    @folk.bio = params[:bio]
    @folk.twitter = params[:twitter]
    @folk.likes = params[:likes]
    @folk.dislikes = params[:dislikes]
    @folk.github = params[:github]
    @folk.quote = params[:quote]
    @folk.save!

     respond_to do |format|
        format.html { redirect_to @folk.url, notice: 'You was successfully updated.' }
        format.json { head :no_content }
    end
end
    
    def edit
    end
  
  
end

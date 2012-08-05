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

    respond_to do |format|
      if @folk.update_attributes(params[:folk])
        format.html { redirect_to @folk, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folk.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end

class PagesController < ApplicationController
  caches_page :robots

  def welcome
    @featured_projects = Project.featured
  end

  def services
    @services = Service.order :sort_order
  end

  def work; end

  def blog; end

  def about
    @team = Admin.where(alumni:false).order(:last_name)
    @alumni = Admin.where(alumni:true).order(:last_name)
  end

  def approach
  end

  def profile
    @folk = Admin.find_by_slug(params[:slug]) || NullAdmin.instance
    @other_folks = Admin.where("slug != '#{params[:slug]}'")
  end

  def contact_us
    if params[:error_check] == "true"
      @message = Message.new(params[:message])
      @message.valid?
    else
      @message = Message.new
    end
  end

  def robots
    robot_type = ENV["DISABLE_ROBOTS"] == "true" ? "staging" : "production"
    robots = File.read(Rails.root + "config/robots/robots.#{robot_type}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end

end

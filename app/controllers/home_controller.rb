class HomeController < ApplicationController
  caches_page :robots

  def index
    #if mobile_request? || tablet_request?
    #  redirect_to '/about'
    #end
    #@featured_projects = Project.find(:all, :limit => 3, :order=> 'created_at desc')
    @projects = Project.all.sort { |x, y| x.id <=> y.id }

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

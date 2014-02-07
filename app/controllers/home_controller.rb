class HomeController < ApplicationController

  def index
    if mobile_request? || tablet_request?
      redirect_to '/about'
    end
    @featured_projects = Project.find(:all, :limit => 3, :order=> 'created_at desc')
  end

  def services
    @services = Service.order :sort_order
  end

  def work; end

  def blog; end

  def about
    @team = Admin.order :last_name
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

end

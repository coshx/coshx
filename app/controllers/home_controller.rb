class HomeController < ApplicationController

  def index
    @featured_projects = Project.find(:all, :limit => 3, :order=> 'created_at desc')
    @clients = Client.all
  end

  def services
    @services = Service.order :sort_order
  end

  def work; end

  def blog; end

  def about
    @coshx_folks = Admin.order :name
  end

  def portfolio
    @clients = Client.all.shuffle # randomizing for fun
  end
  
  def profile
    @folk = Admin.find_by_slug(params[:slug])
    @other_folks = Admin.where("slug != '#{params[:slug]}'")
  end
  
  def contact_us
    @message = Message.new
  end
  
end

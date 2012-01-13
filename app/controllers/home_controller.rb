class HomeController < ApplicationController

  def index; end

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
end

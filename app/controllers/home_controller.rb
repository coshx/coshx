class HomeController < ApplicationController
  def index; end

  def services; end

  def work; end

  def blog; end

  def about
    @coshx_folks = Admin.all.sort_by{|a| a.name}
  end

  def portfolio
    @clients = Client.all.shuffle # randomizing for fun
  end
end

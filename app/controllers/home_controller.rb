class HomeController < ApplicationController
  def index; end

  def services; end

  def work; end

  def blog; end

  def about
    @coshx_folks = Admin.all.sort_by{|a| a.name}
  end
end

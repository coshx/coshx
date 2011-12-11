class JobsController < ApplicationController
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    job = Job.new(:author => current_admin, :title => params[:job][:title], :description => params[:job][:description])

    respond_to do |format|
      if job.save
        format.html { redirect_to admin_root_path, notice: 'Job posting saved' }
      else
        format.html { redirect_to admin_root_path, error: 'Error saving job posting.' }
      end
    end
  end
end

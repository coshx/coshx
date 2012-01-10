class JobsController < ApplicationController


  def index
    if admin_signed_in?
      @jobs = Job.all
    else
      @jobs = Job.published
    end
  end


  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    job = Job.new(:title => params[:job][:title], :description => params[:job][:description])

    respond_to do |format|
      if job.save
        format.html { redirect_to jobs_path, notice: 'Job posting saved' }
      else
        format.html { redirect_to @job, error: 'Error saving job posting.' }
      end
    end
  end

  def edit
    title = params[:id].downcase.gsub("_", " ")
    @job ||= Job.first(:conditions => [ "lower(title) = ?", title.downcase ])
  end

  def update
    title = params[:id].downcase.gsub("_", " ")
    @job ||= Job.first(:conditions => [ "lower(title) = ?", title.downcase ])
    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, :notice => 'Post was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def show
    title = params[:id].downcase.gsub("_", " ")
    @job ||= Job.first(:conditions => [ "lower(title) = ?", title.downcase ])
  end

  def publish
    title = params[:id].downcase.gsub("_", " ")
    @job ||= Job.first(:conditions => [ "lower(title) = ?", title.downcase ])
    respond_to do |format|
      if @job.publish && @job.save
        format.html { redirect_to :action => "index", :notice => 'Job has been published' }
      else
        format.html { redirect_to :action => "index" }
      end
    end
  end


end

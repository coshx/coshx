class JobsController < ApplicationController
  prepend_before_filter :authenticate_admin!, :except => [:index, :show]
  before_filter :build_title, :only => [:show, :edit, :update, :publish]


  def index
    @jobs = Job.all
    @open_jobs = Job.open
    @filled_jobs = Job.filled
  end


  def new
    @job = Job.new
  end

  def create

    @job = Job.new(:title => params[:job][:title], :description => params[:job][:description], :filled => params[:job][:filled])

    if @job.save
      redirect_to @job, notice: 'Job posting saved.'
    else
      flash.now[:alert] = 'Error saving job posting.'
      render :new
    end
  end

  def edit
    @job = Job.where("lower(title) = ?", @title ).first
  end

  def update
    @job = Job.where("lower(title) = ?", @title ).first

    if @job.update_attributes(params[:job])
      redirect_to @job, :notice => 'Job was successfully updated.'
    else
      flash.now[:alert] = 'Error updating job posting.'
      render :edit
    end
  end

  def show
    @job = Job.where("lower(title) = ?", @title ).first
  end

  def publish
    @job = Job.where("lower(title) = ?", @title ).first
    if @job.publish && @job.save
      redirect_to jobs_path, notice: %("#{@job.title}" has been published.)
    else
      redirect_to jobs_path, alert: %(Could not publish "#{@job.title}".)
    end
  end

  private

  def build_title
    @title = params[:id].downcase.gsub '_', ' '
  end
end

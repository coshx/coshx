class FeaturedProjectsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]
  # GET /featured_projects
  # GET /featured_projects.json
  def index
    @featured_projects = FeaturedProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @featured_projects }
    end
  end

  # GET /featured_projects/1
  # GET /featured_projects/1.json
  def show
    @featured_project = FeaturedProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @featured_project }
    end
  end

  # GET /featured_projects/new
  # GET /featured_projects/new.json
  def new
    @featured_project = FeaturedProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @featured_project }
    end
  end

  # GET /featured_projects/1/edit
  def edit
    @featured_project = FeaturedProject.find(params[:id])
  end

  # POST /featured_projects
  # POST /featured_projects.json
  def create
    @featured_project = FeaturedProject.new(params[:featured_project])

    respond_to do |format|
      if @featured_project.save
        format.html { redirect_to @featured_project, notice: 'Featured project was successfully created.' }
        format.json { render json: @featured_project, status: :created, location: @featured_project }
      else
        format.html { render action: "new" }
        format.json { render json: @featured_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /featured_projects/1
  # PUT /featured_projects/1.json
  def update
    @featured_project = FeaturedProject.find(params[:id])

    respond_to do |format|
      if @featured_project.update_attributes(params[:featured_project])
        format.html { redirect_to @featured_project, notice: 'Featured project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @featured_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_projects/1
  # DELETE /featured_projects/1.json
  def destroy
    @featured_project = FeaturedProject.find(params[:id])
    @featured_project.destroy

    respond_to do |format|
      format.html { redirect_to featured_projects_url }
      format.json { head :no_content }
    end
  end
end

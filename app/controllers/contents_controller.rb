class ContentsController < ApplicationController

  before_filter :authenticate_admin!

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @content = Content.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.where("action = ? AND index = ?", params[:content][:action], params[:content][:index]).first
    if @content.blank? 
      @content = Content.new(params[:content])
      @content.save
      message = "created!"
    else
      @content.update_attributes(params[:content])
      message = "Updated!"
    end

    respond_to do |format|
      if message
        format.html { redirect_to @content, notice: message }
        format.json { render json: @content, status: :created, location: @content }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  end
  
  
  def content_update
    
    params[:data].each do |p|
    
      c = Content.find_by_action(p[0])
      if c.blank? 
        Content.new(:action => p[0], :value => p[1]).save!
        message = "created!"
      else
        c.update_attributes(:value => p[1])
        message = "Updated!"
      end
    
    end
    expire_page :controller => :home, :action => :services
    
    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  
  end
  
end

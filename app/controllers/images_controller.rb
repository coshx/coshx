class ImagesController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @images = {:my => current_admin.images, :other => Image.for_other_users_than(current_admin)}
    respond_with(@images)
  end

  def show
    respond_with(@image)
  end

  def new
    @image = Image.new
    respond_with(@image)
  end

  def edit
  end

  def create
    @image = current_admin.images.new(image_params)
    @image.save
    respond_with(@image)
  end

  def update
    @image.update(image_params)
    respond_with(@image)
  end

  def destroy
    @image.destroy
    respond_with(@image)
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params[:image]
    end
end

class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]
  before_action :set_gallery

  # GET /photos
  # GET /photos.json
  def index
    @photos = @gallery.photos

    @title = "Portfolio | #{@gallery.title}"
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_gallery
      @gallery = Gallery.find(params[:portfolio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image)
    end
end

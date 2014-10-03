class Backend::PhotosController < Backend::BackendController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    if params[:gallery_id].present?
      @gallery = Gallery.find(params[:gallery_id])
    else
      @gallery = @current_account.galleries.first
    end
    @photos = @gallery.photos #.page(params[:page]).per(24)
    @photo = Photo.new
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @gallery = Gallery.find(params[:gallery_id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.create(photo_params)
    # @photo = Photo.new(photo_params)
    #
    # respond_to do |format|
    #   if @photo.save
    #     format.html { redirect_to backend_gallery_photo_path(@photo.gallery, @photo), notice: 'Photo was successfully created.' }
    #     format.json { render :create, message: "success", status: 200 }
    #     format.js { render :create, message: "success", status: 200 }
    #   else
    #     format.html { render :new }
    #     format.json { render error: @photo.errors.full_messages.join(','), status: 400 }
    #     format.js { render error: @photo.errors.full_messages.join(','), status: 400 }
    #   end
    # end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to gallery_photo_path(@photo.gallery, @photo), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to gallery_url(@gallery), notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :gallery_id)
    end
end

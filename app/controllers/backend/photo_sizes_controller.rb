class Backend::PhotoSizesController < Backend::BackendController
  before_action :set_photo_size, only: [:show, :edit, :update, :destroy]

  # GET /photo_sizes
  # GET /photo_sizes.json
  def index
    @photo_sizes = @current_account.photo_sizes
  end

  # GET /photo_sizes/1
  # GET /photo_sizes/1.json
  def show
    redirect_to photo_sizes_path
  end

  # GET /photo_sizes/new
  def new
    @photo_size = PhotoSize.new
  end

  # GET /photo_sizes/1/edit
  def edit
  end

  # POST /photo_sizes
  # POST /photo_sizes.json
  def create
    @photo_size = PhotoSize.new(photo_size_params)

    respond_to do |format|
      if @photo_size.save
        format.html { redirect_to photo_sizes_path, notice: 'Photo size was successfully created.' }
        format.json { render :show, status: :created, location: @photo_size }
      else
        format.html { render :new }
        format.json { render json: @photo_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_sizes/1
  # PATCH/PUT /photo_sizes/1.json
  def update
    respond_to do |format|
      if @photo_size.update(photo_size_params)
        format.html { redirect_to photo_sizes_path, notice: 'Photo size was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_size }
      else
        format.html { render :edit }
        format.json { render json: @photo_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_sizes/1
  # DELETE /photo_sizes/1.json
  def destroy
    @photo_size.destroy
    respond_to do |format|
      format.html { redirect_to photo_sizes_path, notice: 'Photo size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_size
      @photo_size = PhotoSize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_size_params
      params.require(:photo_size).permit(:account_id, :title, :price)
    end
end

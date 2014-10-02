class Clients::ShoppingCartItemsController < Clients::ClientsController
  before_action :set_shopping_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /shopping_cart_items
  # GET /shopping_cart_items.json
  def index
    @cart = current_client.current_shopping_cart
    @shopping_cart_items = @cart.shopping_cart_items
    @title ="Shopping Cart"
  end

  # GET /shopping_cart_items/1
  # GET /shopping_cart_items/1.json
  def show
  end

  # GET /shopping_cart_items/new
  def new
    @shopping_cart_item = ShoppingCartItem.new
  end

  # GET /shopping_cart_items/1/edit
  def edit
  end

  # POST /shopping_cart_items
  # POST /shopping_cart_items.json
  def create
    # @shopping_cart_item = ShoppingCartItem.new(shopping_cart_item_params)
    photo = Photo.find(params["shopping_cart_item"]["photo_id"])
    photo_size = PhotoSize.find(params["shopping_cart_item"]["photo_size_id"])
    photo_photo_size = PhotoPhotoSize.where(photo_id: photo.id, photo_size_id: photo_size.id).first_or_create
    cart = ShoppingCart.where(:client_id => current_client.id).first_or_create

    respond_to do |format|
      if cart.add(photo_photo_size, 99.99, params["shopping_cart_item"]["quantity"])
        format.html { redirect_to request.referer, notice: 'Shopping cart item was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_cart_item }
      else
        format.html { render :new }
        format.json { render json: @shopping_cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_cart_items/1
  # PATCH/PUT /shopping_cart_items/1.json
  def update

    respond_to do |format|
      if @shopping_cart_item.update(shopping_cart_item_params)
        format.html { redirect_to shopping_cart_shopping_cart_items_path(@shopping_cart_item.owner_id), notice: 'Shopping cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_cart_item }
      else
        format.html { render :edit }
        format.json { render json: @shopping_cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_cart_items/1
  # DELETE /shopping_cart_items/1.json
  def destroy
    # @cart.remove(@product, 1)

    @shopping_cart_item.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Item was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart_item
      @shopping_cart_item = ShoppingCartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_cart_item_params
      params[:shopping_cart_item].permit(:photo_id, :cart_id, :quantity)
    end
end

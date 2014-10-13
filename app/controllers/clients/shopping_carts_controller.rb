class Clients::ShoppingCartsController < Clients::ClientsController
  before_action :set_shopping_cart, only: [:show, :edit, :update, :destroy, :clear]

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    @shopping_carts = current_client.shopping_carts

    # @cart = ShoppingCart.create(client_id: current_client.id)
    # @photo = Photo.find(1)
    #
    # @cart.add(@photo, 99.99)
  end

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  def show
    @title ="Shopping Cart"
  end

  # GET /shopping_carts/new
  def new
    @shopping_cart = ShoppingCart.where(:client_id => current_client.id, ordered: nil).first_or_create
  end

  # GET /shopping_carts/1/edit
  def edit
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)

    respond_to do |format|
      if @shopping_cart.save
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_cart }
      else
        format.html { render :new }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_carts/1
  # PATCH/PUT /shopping_carts/1.json
  def update
    respond_to do |format|
      if @shopping_cart.update(shopping_cart_params)
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_cart }
      else
        format.html { render :edit }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    @shopping_cart.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: 'Shopping cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clear
    @shopping_cart.delete
    redirect_to shop_galleries_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_cart_params
      params[:shopping_cart].permit(:client_id)
    end
end

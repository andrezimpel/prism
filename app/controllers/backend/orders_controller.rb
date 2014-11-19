class Backend::OrdersController < Backend::BackendController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = @current_account.orders
    @title = "Orders"
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @title = "Order ##{@order.id}"

    @cart = @order.shopping_cart
    @order_items = @cart.items
    @address = @order.addresses.last
  end

  # GET /orders/new
  def new
    @title = "New Order"

    @order = Order.new
    @client = current_client
    @cart = @client.current_shopping_cart
    @order.addresses.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @cart = ShoppingCart.find(params[:order][:shopping_cart_id])
    @title = "New Order"
    # @order.addresses.build(addresses_params)

    respond_to do |format|
      if @order.save
        @order.open_up!
        @cart.update_attributes(ordered: Time.now)

        format.html { redirect_to shop_order_path(@order), notice: 'Order has successfully placed.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    if params["order_action"] == "pay"
      @order.pay!
    end
    if params["order_action"] == "finish"
      @order.finish!
    end

    redirect_to order_path(@order), notice: 'Order was successfully updated.'
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.cancel!
    respond_to do |format|
      format.html { redirect_to shop_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:account_id, :client_id, :state, :amount, :address_id, :shopping_cart_id, :ip_address, :card_expires_on, addresses_attributes: [:account_id, :client_id, :firstname, :lastname, :street, :number, :zipcode, :city, :state, :country, :phone, :order_id])
    end

    def addresses_params
      params[:order].require(:addresses).permit(:account_id, :client_id, :firstname, :lastname, :street, :number, :zipcode, :city, :state, :country, :phone, :order_id)
    end
end

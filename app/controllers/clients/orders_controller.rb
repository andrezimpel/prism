class Clients::OrdersController < Clients::ClientsController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_client.orders
    @title = "Orders"
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cart = @order.shopping_cart
    @order_items = @cart.items
    @title = "Order ##{@order.id}"
  end

  # GET /orders/new
  def new
    @order = Order.new
    @client = current_client
    @cart = @client.current_shopping_cart
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @cart = ShoppingCart.find(params[:order][:shopping_cart_id])

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
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to shop_order_path(@order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:order).permit(:account_id, :client_id, :state, :amount, :address_id, :shopping_cart_id, :ip_address, :card_expires_on)
    end
end

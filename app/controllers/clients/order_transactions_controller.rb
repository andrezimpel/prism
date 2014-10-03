class OrderTransactionsController < ApplicationController
  before_action :set_order_transaction, only: [:show, :edit, :update, :destroy]

  # GET /order_transactions
  # GET /order_transactions.json
  def index
    @order_transactions = OrderTransaction.all
  end

  # GET /order_transactions/1
  # GET /order_transactions/1.json
  def show
  end

  # GET /order_transactions/new
  def new
    @order_transaction = OrderTransaction.new
  end

  # GET /order_transactions/1/edit
  def edit
  end

  # POST /order_transactions
  # POST /order_transactions.json
  def create
    @order_transaction = OrderTransaction.new(order_transaction_params)

    respond_to do |format|
      if @order_transaction.save
        format.html { redirect_to @order_transaction, notice: 'Order transaction was successfully created.' }
        format.json { render :show, status: :created, location: @order_transaction }
      else
        format.html { render :new }
        format.json { render json: @order_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_transactions/1
  # PATCH/PUT /order_transactions/1.json
  def update
    respond_to do |format|
      if @order_transaction.update(order_transaction_params)
        format.html { redirect_to @order_transaction, notice: 'Order transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_transaction }
      else
        format.html { render :edit }
        format.json { render json: @order_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_transactions/1
  # DELETE /order_transactions/1.json
  def destroy
    @order_transaction.destroy
    respond_to do |format|
      format.html { redirect_to order_transactions_url, notice: 'Order transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_transaction
      @order_transaction = OrderTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_transaction_params
      params.require(:order_transaction).permit(:order_id, :amount, :success, :params, :message)
    end
end

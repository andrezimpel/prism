require 'test_helper'

class OrderTransactionsControllerTest < ActionController::TestCase
  setup do
    @order_transaction = order_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_transaction" do
    assert_difference('OrderTransaction.count') do
      post :create, order_transaction: { amount: @order_transaction.amount, message: @order_transaction.message, order_id: @order_transaction.order_id, params: @order_transaction.params, success: @order_transaction.success }
    end

    assert_redirected_to order_transaction_path(assigns(:order_transaction))
  end

  test "should show order_transaction" do
    get :show, id: @order_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_transaction
    assert_response :success
  end

  test "should update order_transaction" do
    patch :update, id: @order_transaction, order_transaction: { amount: @order_transaction.amount, message: @order_transaction.message, order_id: @order_transaction.order_id, params: @order_transaction.params, success: @order_transaction.success }
    assert_redirected_to order_transaction_path(assigns(:order_transaction))
  end

  test "should destroy order_transaction" do
    assert_difference('OrderTransaction.count', -1) do
      delete :destroy, id: @order_transaction
    end

    assert_redirected_to order_transactions_path
  end
end

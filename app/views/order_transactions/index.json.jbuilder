json.array!(@order_transactions) do |order_transaction|
  json.extract! order_transaction, :id, :order_id, :amount, :success, :params, :message
  json.url order_transaction_url(order_transaction, format: :json)
end

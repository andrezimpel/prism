json.array!(@orders) do |order|
  json.extract! order, :id, :account_id, :client_id, :state, :amount, :address_id, :shopping_cart_id, :ip_address, :card_expires_on
  json.url order_url(order, format: :json)
end

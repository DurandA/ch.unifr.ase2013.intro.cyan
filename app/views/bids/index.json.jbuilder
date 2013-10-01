json.array!(@bids) do |bid|
  json.extract! bid, :amount, :user_id, :car_id
  json.url bid_url(bid, format: :json)
end

json.array!(@cars) do |car|
  json.extract! car, :title, :description, :mileage, :color, :brand, :user_id
  json.url car_url(car, format: :json)
end

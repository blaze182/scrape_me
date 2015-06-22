json.array!(@devices) do |device|
  json.extract! device, :id, :imei, :platform_id, :location, :email, :manager
  json.url device_url(device, format: :json)
end

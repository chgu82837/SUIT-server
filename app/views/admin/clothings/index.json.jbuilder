json.array!(@clothings) do |clothing|
  json.extract! clothing, :id, :name
  json.url admin_clothing_url(clothing, format: :json)
end

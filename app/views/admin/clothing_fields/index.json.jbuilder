json.array!(@clothing_fields) do |clothing_field|
  json.extract! clothing_field, :id, :name, :func
  json.url admin_clothing_field_url(clothing_field, format: :json)
end

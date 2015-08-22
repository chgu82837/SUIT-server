json.array!(@clothing_attrs) do |clothing_attr|
  json.extract! clothing_attr, :id,:clothing_id, :clothing_field_id, :value
  json.url admin_clothing_attr_url(clothing_attr, format: :json)
end

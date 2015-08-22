json.array!(@wardrobes) do |wardrobe|
  json.extract! wardrobe, :id, :clothing_id, :user_id
  json.url admin_wardrobe_url(wardrobe, format: :json)
end

json.array!(@recommends) do |recommend|
  json.extract! recommend, :id, :user_id, :clothing_id, :group, :day
  json.url admin_recommend_url(recommend, format: :json)
end

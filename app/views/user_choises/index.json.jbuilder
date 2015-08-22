json.array!(@user_choises) do |user_choise|
  json.extract! user_choise, :id, :user_id, :clothing_id, :liked, :time
  json.url user_choise_url(user_choise, format: :json)
end

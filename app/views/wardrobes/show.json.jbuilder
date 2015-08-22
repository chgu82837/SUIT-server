json.extract! @wardrobe, :id, :chosen, :recommended
json.clothing do
  json.name @wardrobe.clothe.name
  json.attrs do
    json.array!(@wardrobe.clothe.attrs) do |attr|
      json.extract! attr, :name, :func, :value
    end
  end
end

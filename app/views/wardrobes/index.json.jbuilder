json.array!(@wardrobes) do |wardrobe|
  json.extract! wardrobe, :id, :chosen, :recommended
  json.clothing do
    json.name wardrobe.clothe.name
    json.id wardrobe.clothe.id
    json.attrs do
      json.array!(wardrobe.clothe.attrs) do |attr|
        json.extract! attr, :name, :func, :value
      end
    end
  end
end

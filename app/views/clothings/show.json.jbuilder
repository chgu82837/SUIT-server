json.extract! @clothing, :id, :name
json.attrs do
  json.array!(@clothing.attrs) do |attr|
    json.extract! attr, :name, :func, :value
  end
end

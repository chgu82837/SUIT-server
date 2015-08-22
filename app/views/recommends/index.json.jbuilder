@recommends.each do |group,recommends|
  json.set!(group) do
    json.array!(recommends) do |recommend|
      json.name recommend.clothe.name
      json.id recommend.clothe.id
      json.attrs do
        json.array!(recommend.clothe.attrs) do |attr|
          json.extract! attr, :name, :func, :value
        end
      end
    end
  end
end

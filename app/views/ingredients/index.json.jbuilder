json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name
end

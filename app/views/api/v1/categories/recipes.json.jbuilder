json.category do
  json.name @category
  json.recipes(@recipes, :id, :name, :thumbnail)
end

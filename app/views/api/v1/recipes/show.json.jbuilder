json.recipe do
  json.(@recipe, *Recipe::ATTRIBUTES) unless @recipe.nil?
end

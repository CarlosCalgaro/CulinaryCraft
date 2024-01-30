class Themealdb::RecipeBuilder
  
  ATTRIBUTES_MAP = {
    id: :idMeal,
    name: :strMeal,
    thumbnail: :strMealThumb,
    category: :strCategory,
    instructions: :strInstructions, 
    drink_alternate: :strDrinkAlternate,
    area: :strArea,
    tags: :strTags,
    youtube_url: :strYoutube,
    source: :strSource, 
    image_source: :strImageSource, 
    creative_commons_confirmed: :strCreativeCommonsConfirmed, 
    updated_at: :dateModified
  }.freeze

  INGREDIENTS_REGEX = /str(?:Ingredient|Measure)(\d+)/

  def self.from_array(recipes:)
    recipe_builder = Themealdb::RecipeBuilder.new
    recipes.map { |recipe| recipe_builder.build_recipe(recipe) }
  end

  def self.from_hash(recipe:)
    recipe_builder = Themealdb::RecipeBuilder.new
    recipe_builder.build_recipe(recipe)
  end

  def build_recipe(recipe_data)
    attributes = extract_attributes(recipe_data)
    ingredients = build_ingredients(recipe_data)
    Recipe.new(attributes.merge(ingredients: ingredients))
  end

  private 

  def extract_attributes(recipe_data)
    attributes = {}
    ATTRIBUTES_MAP.each do |key, value|
      if key == :id
        attributes[key] = recipe_data[value].to_i
        next
      end
      attributes[key] = recipe_data[value]
    end
    attributes
  end

  def build_ingredients(recipe_data)
    ingredients = recipe_data.keys
                              .group_by { |key| key[INGREDIENTS_REGEX, 1] }
                              .reject { |key| key.nil? }
                              .values
                              .map { |ingredient_keys| build_ingredient(recipe_data, ingredient_keys) }
                              .compact
    ingredients
  end

  def build_ingredient(recipe_data, ingredient_keys)
    name = recipe_data[ingredient_keys[0]]
    measure = recipe_data[ingredient_keys[1]]

    return nil if name.to_s.empty? || measure.to_s.empty?

    Ingredient.new(name: name, measure: measure)
  end
end
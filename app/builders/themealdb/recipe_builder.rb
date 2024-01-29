class Themealdb::RecipeBuilder
  ATTRIBUTES_MAP = {
    id: :idMeal,
    name: :strMeal,
    thumbnail: :strMealThumb
  }.freeze

  def self.from_array(categories)
    categories.map do |category|
      Recipe.new(
        id: category[ATTRIBUTES_MAP[:id]],
        name: category[ATTRIBUTES_MAP[:name]],
        thumbnail: category[ATTRIBUTES_MAP[:thumbnail]]
      )
    end
  end
end

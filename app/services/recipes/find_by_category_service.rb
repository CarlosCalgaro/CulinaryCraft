class Recipes::FindByCategoryService < ApplicationService
  def initialize(category:)
    @category = category
  end

  def call
    recipes = client.recipes_by_category(category: @category)
    Themealdb::RecipeBuilder.from_array(recipes)
  end

  private

  def client
    @client ||= Themealdb::Client::Recipes.new
  end
end

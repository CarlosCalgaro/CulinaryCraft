require 'test_helper'

class Themealdb::RecipeBuilderTest < ActiveSupport::TestCase
  def setup
    @recipe_builder = Themealdb::RecipeBuilder.new
    @recipe_data = [
      {
        idMeal: '1',
        strMeal: 'Meal 1',
        strIngredient1: 'Ingredient 1',
        strMeasure1: 'Measure 1',
        strIngredient2: 'Ingredient 2',
        strMeasure2: 'Measure 2'
      },
      {
        idMeal: '2',
        strMeal: 'Meal 2',
        strIngredient1: 'Ingredient 1',
        strMeasure1: 'Measure 1',
        strIngredient2: 'Ingredient 2',
        strMeasure2: 'Measure 2'
      }
    
    ]
  end

  test "from_array builds recipes from an array of receipts" do
    recipes = Themealdb::RecipeBuilder.from_array(recipes: @recipe_data)

    assert_instance_of Array, recipes
    assert_equal 2, recipes.length
    recipes.each do |recipe|
      assert_instance_of Recipe, recipe
    end
  end

  test "from_hash builds recipe from hash" do
    recipe = @recipe_builder.class.from_hash(recipe: @recipe_data.first)

    assert_instance_of Recipe, recipe
  end

  test "build_recipe creates recipe object" do
    recipe = @recipe_builder.build_recipe(@recipe_data.first)

    assert_instance_of Recipe, recipe
  end

  test "extract_attributes returns attributes hash" do

    recipe = Themealdb::RecipeBuilder.from_hash(recipe: @recipe_data.first)
    assert_equal 1, recipe.id
    assert_equal 'Meal 1', recipe.name
  end

  test "build_ingredients builds ingredients from recipe" do
    recipe = Themealdb::RecipeBuilder.from_hash(recipe: @recipe_data.first)
    ingredients = recipe.ingredients
    assert_instance_of Array, ingredients
    assert_equal 2, ingredients.length

    ingredients.each do |ingredient|
      assert_instance_of Ingredient, ingredient
    end

    assert_equal 'Ingredient 1', ingredients[0].name
    assert_equal 'Measure 1', ingredients[0].measure

    assert_equal 'Ingredient 2', ingredients[1].name
    assert_equal 'Measure 2', ingredients[1].measure
  end
end

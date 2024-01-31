require 'test_helper'

class Api::V1::RecipesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @recipe_id = 12
    @recipe = build(:recipe)
    @recipes_response = @recipe.attributes.transform_keys do |key|
      Themealdb::RecipeBuilder::ATTRIBUTES_MAP[key.to_sym]
    end
  end

  test 'should get show' do
    client_mock = Minitest::Mock.new
    client_mock.expect :recipe, @recipes_response, [], **{ id: @recipe_id }
    Themealdb::Client::Recipes.stub :new, client_mock do
      get api_v1_recipe_path(@recipe_id)

      assert_response :success

      json_response = response.parsed_body
      assert json_response.key?('recipe')

      recipe = json_response['recipe']

      assert_equal @recipe.id, recipe['id']
      assert_equal @recipe.name, recipe['name']
      assert_equal @recipe.thumbnail, recipe['thumbnail']
    end
  end
end

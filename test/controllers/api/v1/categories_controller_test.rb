require 'test_helper'

class Api::V1::CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = build(:category)
  end

  test 'should get index' do
    client_mock = all_categories_mock
    Themealdb::Client::Categories.stub :new, client_mock do
      get api_v1_categories_url
      assert_response :success
    end
    client_mock.verify
  end

  test 'index should return JSON format' do
    client_mock = all_categories_mock
    Themealdb::Client::Categories.stub :new, client_mock do
      get api_v1_categories_url
      assert_response :success
      assert_equal 'application/json; charset=utf-8', @response.content_type
    end

    client_mock.verify
  end

  test 'index should return a JSON array of categories' do
    client_mock = all_categories_mock
    Themealdb::Client::Categories.stub :new, client_mock do
      get api_v1_categories_url
      assert_response :success

      json_response = JSON.parse(@response.body)
      categories = json_response['categories']

      assert_instance_of Hash, json_response
      assert_instance_of Array, categories
      assert_equal 1, categories.size
      assert_json_category_matches_model(@category)
    end

    client_mock.verify
  end

  test 'should get recipes' do
    client_mock = category_recipes_mock
    Themealdb::Client::Recipes.stub :new, client_mock do
      get recipes_api_v1_category_path('category')
      recipes = response.parsed_body['category']['recipes']

      assert_instance_of Array, recipes
      assert_equal 1, recipes.size
      assert_equal 'Beef and Mustard Pie', recipes.first[:name]
      assert_equal 'http://foo.com', recipes.first[:thumbnail]
      assert_equal 52874, recipes.first[:id]
      assert_response :success
    end
    client_mock.verify
  end

  private

  def category_recipes_mock
    response = [
      {
        strMeal: 'Beef and Mustard Pie',
        strMealThumb: 'http://foo.com',
        idMeal: '52874'
      }
    ]
    client_mock = Minitest::Mock.new
    client_mock.expect :recipes_by_category, response, [], **{ category: 'category' }
    client_mock
  end

  def all_categories_mock
    client_mock = Minitest::Mock.new
    client_mock.expect :categories, [{
      idCategory: @category.id,
      strCategory: @category.name,
      strCategoryThumb: @category.thumbnail,
      strCategoryDescription: @category.description
    }]
    client_mock
  end

  def assert_json_category_matches_model(category)
    json_response = JSON.parse(@response.body)['categories'][0]
    assert_equal category.id, json_response['id']
    assert_equal category.name, json_response['name']
    assert_equal category.thumbnail, json_response['thumbnail']
    assert_equal category.description, json_response['description']
  end
end

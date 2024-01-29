require 'test_helper'

class Api::V1::CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = build(:category)
    @categories_response = [{
      idCategory: @category.id,
      strCategory: @category.name,
      strCategoryThumb: @category.thumbnail,
      strCategoryDescription: @category.description
    }]
    @mock = Minitest::Mock.new
    @mock.expect :categories, @categories_response
  end

  test 'should get index' do
    Themealdb::Client::Categories.stub :new, @mock do
      get api_v1_categories_url
      assert_response :success
    end
  end

  test 'index should return JSON format' do
    Themealdb::Client::Categories.stub :new, @mock do
      get api_v1_categories_url
      assert_response :success
      assert_equal 'application/json; charset=utf-8', @response.content_type
    end
  end

  test 'index should return a JSON array of categories' do
    Themealdb::Client::Categories.stub :new, @mock do
      get api_v1_categories_url
      assert_response :success

      json_response = JSON.parse(@response.body)
      categories = json_response['categories']

      assert_instance_of Hash, json_response
      assert_instance_of Array, categories
      assert_equal 1, categories.size
      assert_json_category_matches_model(@category)
    end
  end

  private

  def assert_json_category_matches_model(category)
    json_response = JSON.parse(@response.body)['categories'][0]
    assert_equal category.id, json_response['id']
    assert_equal category.name, json_response['name']
    assert_equal category.thumbnail, json_response['thumbnail']
    assert_equal category.description, json_response['description']
  end
end

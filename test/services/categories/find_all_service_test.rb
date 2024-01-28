require 'test_helper'
class Categories::FindAllServiceTest < ActiveSupport::TestCase
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

  test 'it fetches all categories' do
    Themealdb::Client::Categories.stub :new, @mock do
      categories = Categories::FindAllService.call
      expected = [@category]
      assert_equal(categories.count, @categories_response.count)
      assert_equal(expected, categories)
    end
  end

  test 'it returns an array of Category objects' do
    Themealdb::Client::Categories.stub :new, @mock do
      categories = Categories::FindAllService.call
      assert_instance_of Array, categories
      assert_instance_of Category, categories.first
    end
  end
end

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
  end

  test 'calls fetches categories and build categories array' do
    client_mock = Minitest::Mock.new
    client_mock.expect(:categories, @categories_response)

    Themealdb::Client::Categories.stub(:new, client_mock) do
      Themealdb::CategoryBuilder.stub(:from_array, [@category]) do
        result = Categories::FindAllService.call

        assert_instance_of(Array, result)
        category = result.first
        assert_equal @category.id, category.id
        assert_equal @category.name, category.name
      end
    end

    client_mock.verify
  end
end

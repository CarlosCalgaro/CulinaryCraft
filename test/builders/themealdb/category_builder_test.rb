require 'test_helper'
class Themealdb::CategoryBuilderTest < ActiveSupport::TestCase
  def setup
    @category = build(:category)
    @categories_response = [{
      idCategory: @category.id,
      strCategory: @category.name,
      strCategoryThumb: @category.thumbnail,
      strCategoryDescription: @category.description
    }]
  end

  test 'it builds a Category object from a given array of hashes' do
    categories = Themealdb::CategoryBuilder.from_array(@categories_response)
    assert_equal 1, categories.size
    assert_instance_of Category, categories[0]
  end

  test 'it converts the attributes using the ATTRIBUTES_MAP constant' do
    categories = Themealdb::CategoryBuilder.from_array(@categories_response)
    converted_keys = categories[0].attributes.symbolize_keys.keys
    expected_keys = Themealdb::CategoryBuilder::ATTRIBUTES_MAP.keys
    assert_equal expected_keys.sort, converted_keys.sort
  end

  test 'it correctly maps the attribute values to the new attribute names' do
    categories = Themealdb::CategoryBuilder.from_array(@categories_response)
    assert_equal @category.attributes, categories[0].attributes
  end
end

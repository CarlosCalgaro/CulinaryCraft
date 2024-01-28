require 'test_helper'
class Themealdb::CategoryBuilderTest < ActiveSupport::TestCase
  def setup
    @category = build(:category)
    @categories_array = [{
      idCategory: @category.id,
      strCategory: @category.name,
      strCategoryThumb: @category.thumbnail,
      strCategoryDescription: @category.description
    }]
  end

  test 'it builds a category object from a given array of hashes' do
    categories = Themealdb::CategoryBuilder.from_array(@categories_array)
    assert_equal(1, categories.size)
    assert(categories[0].is_a?(Category))
  end

  test 'it converts the attributes using the ATTRIBUTES_MAP constant' do
    categories = Themealdb::CategoryBuilde.r.from_array(@categories_array)
    converted_keys = categories[0].attributes.symbolize_keys.keys
    assert_equal(converted_keys.sort, Themealdb::Mappers::Categories::ATTRIBUTES_MAP.keys.sort)
  end

  test 'it correctly maps the attributes values to the new attribute names' do
    categories = Themealdb::CategoryBuilder.from_array(@categories_array)
    assert_equal(categories[0].attributes, @category.attributes)
  end
end

require 'test_helper'

class Themealdb::Client::CategoriesTest < ActiveSupport::TestCase
  def setup
    @category = create(:category)
    @stubs = Faraday::Adapter::Test::Stubs.new
    @connection = Faraday.new { |b| b.adapter(:test, @stubs) }
    @stubs.get('/categories.php') do
      [200, { 'Content-Type': 'application/json' }, all_categories_response_json]
    end
  end

  def all_categories_response_json
    {
      categories: [{
        idCategory: @category.id,
        strCategory: @category.name,
        strCategoryThumb: @category.thumbnail,
        strCategoryDescription: @category.description
      }]
    }
  end

  test 'it calls categories.php and returns all categories parsed' do
    client = Themealdb::Client::Categories.new(connection: @connection)
    categories = client.categories

    assert_equal(all_categories_response_json[:categories], categories)
  end
end

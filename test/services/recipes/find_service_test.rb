require 'test_helper'

class Recipes::FindServiceTest < ActiveSupport::TestCase
  def setup
    @recipe_id = 123
  end

  test 'call fetches recipe and builds a Recipe object' do
    expected_response = [Recipe.new(id: 123, name: 'Test Recipe')]
    client_mock = Minitest::Mock.new
    client_mock.expect :recipe, nil do |id:|
      id.is_a? Integer
    end

    Themealdb::Client::Recipes.stub(:new, client_mock) do
      Themealdb::RecipeBuilder.stub(:from_hash, expected_response) do
        result = Recipes::FindService.call(id: @recipe_id)

        assert_instance_of Array, result
        assert_equal 123, result.first.id
        assert_equal 'Test Recipe', result.first.name
      end
    end

    client_mock.verify
  end
end

require 'test_helper'

module Api
  module V1
    class RecipesControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_v1_recipes_url
        assert_response :success
      end

      test 'should get show' do
        get api_v1_recipe_url(1)
        assert_response :success
      end
    end
  end
end

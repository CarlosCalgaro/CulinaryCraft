require 'test_helper'

module Api
  module V1
    class CategoriesControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get categories_index_url
        assert_response :success
      end
    end
  end
end

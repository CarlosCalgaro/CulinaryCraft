module Api
  module V1
    class CategoriesController < BaseController
      def index
        @categories = Categories::FindAllService.call
      end
    end
  end
end

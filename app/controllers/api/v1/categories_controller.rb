class Api::V1::CategoriesController < BaseController
  def index
    @categories = Categories::FindAllService.call
  end

  def recipes
    @category = params[:id]
    @recipes = Recipes::FindByCategoryService.call(category: @category)
  end
end

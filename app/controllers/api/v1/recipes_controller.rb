class Api::V1::RecipesController < BaseController
  def show
    @recipe = Recipes::FindService.call(id: params[:id])
  end

  def by_category
    @recipes = Recipes::FindByCategoryService.call(category: params[:category])
  end
end

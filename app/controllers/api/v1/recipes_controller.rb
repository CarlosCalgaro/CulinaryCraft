class Api::V1::RecipesController < BaseController
  def show
    @recipe = Recipes::FindService.call(id: params[:id].to_i)
  end
end

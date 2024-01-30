class Recipes::FindService < ApplicationService
  def initialize(id:)
    @id = id
  end

  def call
    @resp = client.recipe(id: @id)
    Themealdb::RecipeBuilder.from_hash(recipe: @resp)
  end

  private

  def client
    @client ||= Themealdb::Client::Recipes.new
  end
end

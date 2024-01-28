class Categories::FindAllService < ApplicationService
  def call
    categories = client.categories
    Themealdb::CategoryBuilder.from_array(categories)
  end

  private

  def client
    @client ||= Themealdb::Client::Categories.new
  end
end

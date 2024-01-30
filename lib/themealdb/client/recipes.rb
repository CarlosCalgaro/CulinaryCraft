class Themealdb::Client::Recipes < Themealdb::Http
  def recipes_by_category(category:)
    response = get(url: 'filter.php', params: { c: category }).body
    response[:meals]
  end
end

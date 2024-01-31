class Themealdb::Client::Recipes < Themealdb::Http
  def recipes_by_category(category:)
    response = get(url: 'filter.php', params: { c: category }).body
    response[:meals]
  end

  def recipe(id:)
    response = get(url: 'lookup.php', params: { i: id }).body
    response[:meals]&.first
  end
end

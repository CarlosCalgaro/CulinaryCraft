class Themealdb::Client::Categories < Themealdb::Http
  def categories
    response = get(url: 'categories.php').body
    response[:categories]
  end
end

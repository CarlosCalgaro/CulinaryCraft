class Themealdb::CategoryBuilder
  ATTRIBUTES_MAP = {
    id: :idCategory,
    name: :strCategory,
    thumbnail: :strCategoryThumb,
    description: :strCategoryDescription
  }.freeze

  def self.from_array(categories)
    category_builder = Themealdb::CategoryBuilder.new
    categories.map { |category| category_builder.build_category(category) }
  end

  def build_category(category)
    Category.new(
      id: category[ATTRIBUTES_MAP[:id]].to_i,
      name: category[ATTRIBUTES_MAP[:name]],
      description: category[ATTRIBUTES_MAP[:description]],
      thumbnail: category[ATTRIBUTES_MAP[:thumbnail]]
    )
  end
end

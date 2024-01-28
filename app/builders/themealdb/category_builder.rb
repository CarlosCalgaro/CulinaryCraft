class Themealdb::CategoryBuilder
  ATTRIBUTES_MAP = {
    id: :idCategory,
    name: :strCategory,
    thumbnail: :strCategoryThumb,
    description: :strCategoryDescription
  }.freeze

  def self.from_array(categories)
    categories.map do |category|
      Category.new(
        id: category[ATTRIBUTES_MAP[:id]],
        name: category[ATTRIBUTES_MAP[:name]],
        description: category[ATTRIBUTES_MAP[:description]],
        thumbnail: category[ATTRIBUTES_MAP[:thumbnail]]
      )
    end
  end
end

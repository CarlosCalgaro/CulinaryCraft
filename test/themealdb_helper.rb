module ThemealdbHelper
  def build_category_json(categories)
    return category_json_for(categories) if categories.is_a? Hash
    categories.map(:category_json_for)
  end

  private

  def category_json_for(category)
    {
      idCategory: category.id,
      strCategory: category.name,
      strCategoryThumb: category.thumbnail,
      strCategoryDescription: category.description
    }
  end
end

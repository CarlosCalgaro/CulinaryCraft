class Recipe
  include ActiveModel::API

  attr_accessor :id, :name, :thumbnail

  def attributes
    {
      'id' => @id,
      'name' => @name,
      'thumbnail' => @thumbnail
    }
  end

  def ==(other)
    super || (
      self.class == other.class &&
      @id == other.id &&
      @name == other.name &&
      @thumbnail == other.thumbnail
    )
  end
end

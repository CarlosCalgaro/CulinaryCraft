class Category
  include ActiveModel::API

  attr_accessor :id, :name, :thumbnail, :description

  def attributes
    {
      'id' => @id,
      'name' => @name,
      'thumbnail' => @thumbnail,
      'description' => @description
    }
  end

  def ==(other)
    super || (
      self.class == other.class &&
      @id == other.id &&
      @name == other.name &&
      @thumbnail == other.thumbnail &&
      @description == other.description
    )
  end
end

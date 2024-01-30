class Recipe
  include ActiveModel::API

  ATTRIBUTES = [:id, :name, :thumbnail, :instructions, :drink_alternate, :area, :tags,
                :source, :image_source, :creative_commons_confirmed, :updated_at, :ingredients,
                :youtube_url, :category].freeze

  attr_accessor  *ATTRIBUTES

  def attributes
    atts = {}
    ATTRIBUTES.each do |attr|
      atts[attr.to_s] = public_send(attr)
    end
    atts
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

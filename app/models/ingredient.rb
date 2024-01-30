class Ingredient
  include ActiveModel::API

  ATTRIBUTES = [:name, :measure]

  attr_accessor *ATTRIBUTES

  def attributes
    attributes = {}
    ATTRIBUTES.each do |attr|
      attributes[attr.to_s] = public_send(attr)
    end
    attributes
  end

  def ==(other)
    super || (
      self.class == other.class &&
      @name == other.name &&
      @measure == other.measure
    )
  end
end

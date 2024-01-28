class Category
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :id, :integer
  attribute :name, :string
  attribute :thumbnail, :string
  attribute :description, :string
end

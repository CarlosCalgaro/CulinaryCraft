class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(id: 1, name: 'Test Category', thumbnail: 'test.png', description: 'Test Description')
  end

  test 'attributes are set correctly' do
    assert_equal 1, @category.id
    assert_equal 'Test Category', @category.name
    assert_equal 'test.png', @category.thumbnail
    assert_equal 'Test Description', @category.description
  end

  test 'attributes method returns a hash with correct keys and values' do
    expected_attributes = {
      'id' => 1,
      'name' => 'Test Category',
      'thumbnail' => 'test.png',
      'description' => 'Test Description'
    }

    assert_equal expected_attributes, @category.attributes
  end

  test 'equality comparison works correctly' do
    same_category = Category.new(id: 1, name: 'Test Category', thumbnail: 'test.png', description: 'Test Description')
    different_category = Category.new(id: 2, name: 'Different Category', thumbnail: 'different.png', description: 'Different Description')

    assert_equal @category, same_category
    assert_not_equal @category, different_category
  end

  test 'equality comparison handles non-Category objects gracefully' do
    non_category_object = { id: 1, name: 'Test Category', thumbnail: 'test.png', description: 'Test Description' }

    assert_not_equal @category, non_category_object
  end
end

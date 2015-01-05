require 'test_helper'

class AlbumCollectionTest < ActiveSupport::TestCase
  def setup
    album_collection_params = {
        id: 1,
        name: "Name of Album collection",
        user_id: 1
    }
    @album_collection = AlbumCollection.new(album_collection_params)
  end

  test "album collection should be valid" do
    assert @album_collection.valid?
  end

  test "name should not be empty" do
    @album_collection.name = ""
    assert_not @album_collection.valid?
  end

  test "user id should not be empty" do
    @album_collection.user_id = nil
    assert_not @album_collection.valid?
  end

  test "name should be capitalized" do
    @album_collection = AlbumCollection.find(1)
    @album_collection.update(name: "bazzers album collection")

    expected = "Bazzers Album Collection"
    assert_equal expected, @album_collection.name
  end
end

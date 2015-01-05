require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  def setup

    album_params = {
        name: "Example Album",
        band: "Example Band",
        image: "http://example.com/image.jpg",
        position: 1,
        albumCollection_id: 1
    }

    @album = Album.new(album_params)

  end

  test "album should be valid" do
    assert @album.valid?
  end

  test "name should not be empty" do
    @album.name = ""
    assert_not @album.valid?
  end

  test "band should not be empty" do
    @album.band = ""
    assert_not @album.valid?
  end

  test "image should not be empty" do
    @album.image = ""
    assert_not @album.valid?
  end

  test "position should not be empty" do
    @album.position = ""
    assert_not @album.valid?
  end

  test "album should belong to album collection" do
    expected = 1
    assert_equal expected, @album.albumCollection_id
  end
end

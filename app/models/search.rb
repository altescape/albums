class Search

  attr_accessor :placeholder

  def initialize
    @api = Api.new
  end

  def get_album(album_key)
    @api.get_item(album_key)
  end

  def search_albums(keywords = nil)
    if keywords
      @api.search(keywords)
    end
  end
end
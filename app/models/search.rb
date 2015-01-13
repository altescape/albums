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
      self.set_placeholder("Searching #{keywords}")
      @api.search(keywords)
    end
  end

  def get_placeholder
    self.placeholder
  end

  def set_placeholder(message)
    self.placeholder = message
  end

  def search

  end
end
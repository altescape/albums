class Search

  attr_accessor :placeholder

  def initialize
    @api = Api.new
  end

  def get_album(album_key)
    @api.get_item(album_key)
  end

  def search_albums(keywords = nil)
    unless keywords
      keywords = random_artist
    end
    self.set_placeholder("Searching #{keywords}")
    @api.search(keywords)
  end

  def get_placeholder
    self.placeholder
  end

  def set_placeholder(message)
    self.placeholder = message
  end

  def random_artist
    ["Lenny Kravitz", "Jane's Addiction", "The Damned",
     "Weezer", "London Philharmonic", "John Williams",
     "City of Prague Philharmonic Orchestra", "The Movies", "Danger Mouse", "Dead Kennedys"].sample
  end
end
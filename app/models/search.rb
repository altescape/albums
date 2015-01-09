class Search

  attr_accessor :placeholder

  def initialize
    @api = Api.new.get
  end

  def get_album(album_key)
    @api.get(:keys => album_key, :extras => "-*, icon,artist,name,key,releaseDate,length")[album_key]
  end

  def search_albums(keywords = nil)
    unless keywords
      keywords = random_artist
    end

    self.set_placeholder("Searching #{keywords}")

    @api.search(:query => keywords, :types => "album", :count => 12, :extras => "-*, icon,artist,name,key").results
  end

  def get_placeholder
    self.placeholder
  end

  def set_placeholder(message)
    self.placeholder = message
  end

  def random_artist
    ["Lenny Kravitz", "Jane's Addiction", "The Damned",
     "Weezer", "Buzzcocks", "Eagles of Death Metal",
     "Band of Skulls", "The Shins", "Kasabian", "Dead Kennedys"].sample
  end
end
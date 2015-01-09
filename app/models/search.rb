class Search
  def initialize
    @api = Api.new.get
  end

  def get_album(album_key)
    @api.get(:keys => album_key, :extras => "-*, icon,artist,name,key,releaseDate,length")[album_key]
  end

  def search_albums(search_param = nil)

    if search_param
      search_term = search_param
      @placeholder = search_term
    else
      search_term = [
          "Lenny Kravitz",
          "Jane's Addiction",
          "The Damned",
          "Weezer",
          "Eagles of Death Metal",
          "Band of Skulls",
          "The Shins",
          "Kasabian",
          "Dead Kennedys",
          "Buzzcocks"].sample
      @placeholder = "Random search: " + search_term
    end

    @api.search(:query => search_term, :types => "album", :count => 12, :extras => "-*, icon,artist,name,key").results
  end
end
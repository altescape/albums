class Search
  def initialize
    @api = Api.new.get
  end

  def get_album(album_key)
    @api.get(:keys => album_key, :extras => "-*, icon,artist,name,key,releaseDate,length")[album_key]
  end

  def search_albums(album_name)
    @api.search(:query => album_name, :types => "album", :count => 12, :extras => "-*, icon,artist,name,key").results
  end
end
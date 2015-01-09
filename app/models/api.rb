class Api
  def initialize
    @api = RdioApi.new(:consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET'])
  end

  def get
    @api
  end

  def get_item(album_key)
    @api.get(:keys => album_key, :extras => "-*, icon,artist,name,key,releaseDate,length")[album_key]
  end

  def search(keywords, count=12)
    @api.search(:query => keywords, :types => "album", :count => count, :extras => "-*, icon,artist,name,key").results
  end
end
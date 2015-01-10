require 'rspotify'

class Api
  def initialize
    @api = RdioApi.new(:consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET'])
  end

  def get
    @api
  end

  def get_item(album_key)
    result = @api.get(:keys => album_key, :extras => "-*, icon,artist,name,key,releaseDate,length")[album_key]
    {
        name: result.name,
        artist: result.artist,
        image: result.icon.gsub('square-200', 'square-400'),
        position: result.position,
        release_date: Date.strptime(result.releaseDate.to_s, '%Y-%m-%d').year
    }
  end

  def search(keywords, count=12)
    RSpotify::Album.search(keywords)
    # @api.search(:query => keywords, :types => "album", :count => count, :extras => "-*, icon,artist,name,key").results
  end
end
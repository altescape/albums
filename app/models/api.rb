require 'rspotify'

class Api
  def initialize
    #@api = RdioApi.new(:consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET'])
  end

  def get
    @api
  end

  def get_item(album_key)
    # Rdio API
    # result = @api.get(:keys => album_key, :extras => "-*, icon,artist,name,key,releaseDate,length")[album_key]
    # {
    #     name: result.name,
    #     artist: result.artist,
    #     image: result.icon.gsub('square-200', 'square-400'),
    #     position: result.position,
    #     release_date: Date.strptime(result.releaseDate.to_s, '%Y-%m-%d').year
    # }

    # Spotify API
    album = RSpotify::Album.find(album_key)

    name = album.name
    artist = album.artists.first
    image = album.images.first
    image_url = image['url']
    release_date = album.release_date

    {
        name: name,
        artist: artist.name,
        image: image_url,
        release_date: release_date
    }
  end

  def search(keywords)
    # Rdio API
    # @api.search(:query => keywords, :types => "album", :count => count, :extras => "-*, icon,artist,name,key").results

    # Spotify API
    RSpotify::Album.search(keywords)
  end
end
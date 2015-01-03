module AlbumsHelper

  @@client = RdioApi.new(:consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET'])

  def rdio_album
    if params[:s]
      search_term = params[:s]
    else
      search_term = ["Lenny Kravitz", "Jane's Addiction", "The Damned", "Weezer", "Eagles of Death Metal", "Band of Skulls", "The Shins", "Kasabian", "Dead Kennedys", "Buzzcocks"].sample
    end
    search_term
  end

  def rdio_connect(album_name)
    @@client.search(:query => album_name, :types => "album", :count => 12, :extras => "-*, icon,artist,name,key").results
  end

  def rdio_get_album(album_key)
    @@client.get(:keys => album_key, :extras => "-*, icon,artist,name,key")[album_key]
  end

  def rdio_format
    rdio_connect.each do |r|
      # . . .
    end
  end

end

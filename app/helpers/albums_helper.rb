module AlbumsHelper

  @@client = RdioApi.new(:consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET'])

  def rdio_connect(search_term = "Lenny Kravitz")
    if params[:s]
      search_term = params[:s]
    end

    @@client.search(:query => search_term, :types => "album", :extras => "-*, icon,artist,name").results
  end

  def rdio_format
    rdio_connect.each do |r|
      # . . .
    end
  end

end

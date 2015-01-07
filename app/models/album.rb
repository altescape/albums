class Album < ActiveRecord::Base
  belongs_to :album_collection

  before_validation :api_access

  validates :name, presence: true
  validates :image, presence: true
  validates :band, presence: true
  validates :position, presence: true

  def api_access
    RdioApi.new(:consumer_key => ENV['CONSUMER_KEY'], :consumer_secret => ENV['CONSUMER_SECRET'])
  end

  def get_album(album_key)
    api_access.get(:keys => album_key, :extras => "-*, icon,artist,name,key,releaseDate,length")[album_key]
  end

  def search_albums(album_name)
    api_access.search(:query => album_name, :types => "album", :count => 12, :extras => "-*, icon,artist,name,key").results
  end

end

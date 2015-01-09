class Album < ActiveRecord::Base

  belongs_to :album_collection

  validates :name, presence: true
  validates :image, presence: true
  validates :artist, presence: true
  validates :position, presence: true

  def details
    {
        name: self.name,
        artist: self.artist,
        image: self.image.gsub('square-200', 'square-400'),
        position: self.position
        # @release_date = Date.strptime(@album.releaseDate.to_s, '%Y-%m-%d').year
    }
  end

end

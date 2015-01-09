class Album < ActiveRecord::Base

  belongs_to :album_collection

  before_create :check_for_existing

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

  def check_for_existing
    # query all album collection and retrieve album ids
    # query each album and check position doesnt equal current position
    # if it does then remove previous album and replace with this new one
  end

end

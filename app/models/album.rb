class Album < ActiveRecord::Base

  belongs_to :album_collection

  validates :name, presence: true
  validates :image, presence: true
  validates :artist, presence: true
  validates :position, presence: true

  def check_for_existing(collection_id, position)
    albums = Albums.where(album_collection_id: collection_id, position: position)

    if albums

    end
    # query all album collection and retrieve album ids
    # query each album and check position doesnt equal current position
    # if it does then remove previous album and replace with this new one
  end

  def find_album(album_id, position)
    search = Search.new
    album = search.get_album(album_id)
    {
        name: album[:name], artist: album[:artist], image: album[:image], position: position
    }
  end

  def get_album_collection(current_user)
    AlbumCollection.find_by(user_id: current_user.id)
  end

end

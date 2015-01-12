class Album < ActiveRecord::Base

  belongs_to :album_collection
  before_create :check_for_existing

  default_scope { order("position ASC") }

  validates :name, presence: true
  validates :image, presence: true
  validates :artist, presence: true
  validates :position, presence: true

  def check_for_existing
    # query all album collection and retrieve album ids
    # query each album and check position doesnt equal current position
    # if it does then remove previous album and replace with this new one
  end

end

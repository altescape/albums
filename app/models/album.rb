class Album < ActiveRecord::Base

  belongs_to :album_collection

  before_validation :api_access

  validates :name, presence: true
  validates :image, presence: true
  validates :artist, presence: true
  validates :position, presence: true

end

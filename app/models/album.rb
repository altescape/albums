class Album < ActiveRecord::Base
  belongs_to :album_collection

  validates :name, presence: true
  validates :image, presence: true
  validates :band, presence: true
  validates :position, presence: true

end

class AlbumCollection < ActiveRecord::Base
  belongs_to :user
  has_many :albums, foreign_key: "albumCollection_id"
end

class AlbumCollection < ActiveRecord::Base
  belongs_to :user
  has_many :albums, foreign_key: "albumCollection_id"

  before_save { self.name = name.titlecase }
  after_update { self.name = name.titlecase }
  validates :name, presence: true
  validates :user_id, presence: true
end

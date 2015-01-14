class AlbumCollection < ActiveRecord::Base

  belongs_to :user
  has_many :albums, dependent: :destroy

  validates :user_id, presence: true

end

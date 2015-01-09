class AlbumCollection < ActiveRecord::Base

  belongs_to :user
  has_many :albums, dependent: :destroy

  before_validation { create_name }

  validates :name, presence: true
  validates :user_id, presence: true

  def create_name
    self.name = User.find(user_id).name + "'s Desert Island Discs"
  end
end

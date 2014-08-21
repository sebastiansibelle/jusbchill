class Release < ActiveRecord::Base
  extend FriendlyId
  friendly_id :release_no, use: :slugged
  belongs_to :artist
  validates :avatar, presence: true
  validates :release_no, presence: true, uniqueness: true
  validates :title, presence: true

  mount_uploader :avatar, AvatarUploader
end

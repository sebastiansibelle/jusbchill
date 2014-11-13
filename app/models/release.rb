class Release < ActiveRecord::Base
  extend FriendlyId
  friendly_id :release_no, use: :slugged
  belongs_to :artist
  validates :avatar, presence: true
  validates :release_no, presence: true, uniqueness: true
  validates :title, presence: true
  validates :soundcloud_embed, presence: true

  default_scope { order('release_no') }

  # To have published and unpublished releases
  # http://stackoverflow.com/questions/16788273/rails-displaying-published-post-by-all-and-unpublished-post-of-current-user

  scope :published, -> { where(published: true)  }
  scope :un_published, -> { where(published: false) }

  mount_uploader :avatar, AvatarUploader
  crop_uploaded :avatar
end
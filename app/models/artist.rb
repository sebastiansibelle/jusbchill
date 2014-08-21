class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :releases
  validates :name, presence: true
  validates :biography, presence: true, length: { minimum: 25 }
  validates :soundcloud, url: true
  validates :facebook, url: true
  validates :twitter, url: true

  mount_uploader :avatar, AvatarUploader
end

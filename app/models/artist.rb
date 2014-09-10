class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :releases
  validates :name, presence: true
  validates :biography, presence: true, length: { minimum: 25 }
  validates :avatar, presence: true
  validates :soundcloud_embed, presence: true
  validates :soundcloud, url: true
  validates :facebook, url: true
  validates :twitter, url: true

  mount_uploader :avatar, AvatarUploader
  crop_uploaded :avatar
  def name_with_initial
    "#{name}.1"
  end
end

class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :releases
  validates :name, presence: true
  validates :biography, presence: true, length: { minimum: 25 }
  
  mount_uploader :avatar, AvatarUploader
end

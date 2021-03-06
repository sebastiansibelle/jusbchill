class Mix < ActiveRecord::Base
  extend FriendlyId
  friendly_id :mix_no, use: :slugged

  belongs_to :artist
  validates :avatar, presence: true
  validates :mix_no, presence: true, uniqueness: true
  validates :title, presence: true
  validates :soundcloud_embed, presence: true
  
  acts_as_opengraph :values => { :type => "music.playlist"}
  
  def opengraph_image
    avatar.jumbo.url
  end

  default_scope { order('mix_no desc') }

  # To have published and unpublished releases
  # http://stackoverflow.com/questions/16788273/rails-displaying-published-post-by-all-and-unpublished-post-of-current-user
  scope :published, -> { where(published: true)  }
  scope :un_published, -> { where(published: false) }

  mount_uploader :avatar, AvatarUploader
  crop_uploaded :avatar
end
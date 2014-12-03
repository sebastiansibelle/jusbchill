class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :releases
  has_many :mixes

  validates :name, presence: true
  validates :biography, presence: true, length: { minimum: 25 }
  validates :avatar, presence: true
  validates :soundcloud_embed, presence: true
  validates :soundcloud, url: true
  validates :facebook, url: true
  validates :twitter, url: true

  acts_as_opengraph :columns => {:url => :soundcloud }, 
                    :values => { :type => :profile}

  def opengraph_image
    avatar.jumbo.url
  end

  mount_uploader :avatar, AvatarUploader
  crop_uploaded :avatar

  # To have published and unpublished artists
  # http://stackoverflow.com/questions/16788273/rails-displaying-published-post-by-all-and-unpublished-post-of-current-user
  scope :published, -> { where(published: true) }
  scope :un_published, -> { where(published: false) }

  # Forces new slugs to be generated on save if the name changes.
  # http://stackoverflow.com/questions/17764359/rails-4-friendly-id-slug-not-updating
  def should_generate_new_friendly_id?
    name_changed?
  end
end

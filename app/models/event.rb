class Event < ActiveRecord::Base
  extend FriendlyId

  has_and_belongs_to_many :artists
  friendly_id :slug, use: :slugged
  validates :slug, presence: true, uniqueness: true

  acts_as_opengraph :values => { :type => "event"}

  # To have published and unpublished releases
  # http://stackoverflow.com/questions/16788273/rails-displaying-published-post-by-all-and-unpublished-post-of-current-user
  scope :published, -> { where(published: true)  }
  scope :un_published, -> { where(published: false) }
  default_scope { order('slug') }

  def opengraph_image
    cover.facebook.url
  end
  
  mount_uploader :cover, BannerUploader
  crop_uploaded :cover

  mount_uploader :trailer, BannerUploader
  crop_uploaded :trailer

  def url
  end
end


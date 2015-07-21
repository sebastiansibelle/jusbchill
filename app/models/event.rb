class Event < ActiveRecord::Base
  extend FriendlyId

  has_many :performances
  has_many :artists, through: :performances do
    def featured
     where("performances.featured = ?", true)
    end
  end

  accepts_nested_attributes_for :artists, :reject_if => :all_blank, :allow_destroy => true

  friendly_id :slug, use: :slugged
  validates :slug, presence: true, uniqueness: true

  acts_as_opengraph :values => { :type => "event"}

  # To have published and unpublished releases
  # http://stackoverflow.com/questions/16788273/rails-displaying-published-post-by-all-and-unpublished-post-of-current-user
  scope :published, -> { where(published: true).order('slug desc') }
  scope :un_published, -> { where(published: false) }
  
  default_scope { order('slug desc') }

  def opengraph_image
    facebook_image.facebook.url
  end
  
  mount_uploader :cover, BannerUploader
  crop_uploaded :cover

  mount_uploader :facebook_image, BannerUploader
  crop_uploaded :facebook_image

  mount_uploader :trailer, BannerUploader
  crop_uploaded :trailer

  def url
    if self.cool_room?
      return "coolroom/episode/#{self.slug}"
    else
      return "events/#{self.slug}"
    end
  end
end


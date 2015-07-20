class Event < ActiveRecord::Base
  extend FriendlyId

  has_many :performances
  has_many :artists, through: :performances
  accepts_nested_attributes_for :artists, :reject_if => :all_blank, :allow_destroy => true

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
    if self.cool_room?
      return "coolroom/episode/#{self.slug}"
    else
      return event_path(self)
    end
  end
end


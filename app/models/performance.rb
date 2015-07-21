class Performance < ActiveRecord::Base
  belongs_to :artist
  belongs_to :event

  accepts_nested_attributes_for :artist, allow_destroy: true
  scope :featured, -> {where(featured: true)}

  default_scope { order('running_order asc') }
end
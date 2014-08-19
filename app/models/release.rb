class Release < ActiveRecord::Base
  extend FriendlyId
  friendly_id :release_no, use: :slugged
  belongs_to :artist
end

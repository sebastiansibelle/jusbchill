class Artist < ActiveRecord::Base
  has_many :releases
  validates :name, presence: true
  validates :biography, presence: true, length: { minimum: 25 }

end

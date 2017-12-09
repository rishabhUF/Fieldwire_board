class Floorplan < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :versions
  validates_presence_of :name
end
class Floorplan < ApplicationRecord
  belongs_to :project
  belongs_to :user

  mount_uploader :image, FloorplanImageUploader
end

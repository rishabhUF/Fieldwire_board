class Floorplan < ApplicationRecord
  belongs_to :project
  belongs_to :user
  mount_uploader :image, ImageUploader
   validates_presence_of :image
  before_create :default_name
  
  def default_name
  	self.name = File.basename(image.identifier, '.*').titleize
  end
end

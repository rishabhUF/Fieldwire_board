class Version < ApplicationRecord
  belongs_to :floorplan
  belongs_to :project
  belongs_to :user
  attr_accessor :content_type, :file_size
  mount_uploader :image, ImageUploader
  

  def default_name
  	self.name ||= File.basename(image.identifier, '.*').titleize
  end
end

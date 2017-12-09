class Project < ApplicationRecord
	belongs_to :user
	has_many :floorplans
	has_many :versions
end

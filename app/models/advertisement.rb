class Advertisement < ActiveRecord::Base
   belongs_to :welcome
   has_many :advertisementassociates
   mount_uploader :imageAd, ImageUploader
   
end

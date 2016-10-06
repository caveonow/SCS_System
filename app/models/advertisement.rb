class Advertisement < ActiveRecord::Base
   belongs_to :welcome
   mount_uploader :imageAd, ImageUploader
end

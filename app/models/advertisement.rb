class Advertisement < ActiveRecord::Base
   mount_uploader :imageAd, ImageUploader
end

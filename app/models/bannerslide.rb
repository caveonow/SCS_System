class Bannerslide < ActiveRecord::Base
  belongs_to :welcome
  mount_uploader :imageBs, ImageUploader
end

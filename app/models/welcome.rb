class Welcome < ActiveRecord::Base
  has_one :advertisements
  has_many :bannerslides
end

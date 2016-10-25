class Welcome < ActiveRecord::Base
  has_one :advertisements
  has_many :bannerslides
  belongs_to :user
end

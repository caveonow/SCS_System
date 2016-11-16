class Yearofstudy < ActiveRecord::Base
  has_many :users
  has_many :advertisements
  has_many :user_imports
end

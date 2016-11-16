class Faculty < ActiveRecord::Base
  has_many :advertisements
  has_many :users
  has_many :user_imports
end

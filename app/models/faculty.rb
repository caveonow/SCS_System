class Faculty < ActiveRecord::Base
  has_many :advertisements
  has_many :users
end

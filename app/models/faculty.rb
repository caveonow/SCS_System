class Faculty < ActiveRecord::Base
  has_many :programmes
  has_many :user
end

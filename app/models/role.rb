class Role < ActiveRecord::Base
  has_many :users
  has_many :user_imports
end
class Subanswer < ActiveRecord::Base
  belongs_to :answer
  has_many :studsubanswer,  :dependent => :destroy
end

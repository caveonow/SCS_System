class Subquestionanswer < ActiveRecord::Base
  belongs_to :subquestion
  has_many :studsubquestionanswer,  :dependent => :destroy
end

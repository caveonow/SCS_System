class Subquestion < ActiveRecord::Base
  belongs_to :answer
  has_many :subquestionanswer, :dependent => :destroy
 
  has_many :studsubquestionanswer, through: :subquestionanswer
end

class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answer
  
  has_many :subanswer, through: :answer
  has_many :subquestion, through: :answer
  has_many :subquestionanswer, through: :subquestion
end

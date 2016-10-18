class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :subanswer
  has_many :subquestion
  
  has_many :subquestionanswer, through: :subquestion
end

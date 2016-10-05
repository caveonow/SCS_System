class Section < ActiveRecord::Base
  belongs_to :form
  has_many :question
  
  has_many :answer, through: :question
  has_many :subanswer, through: :answer
  has_many :subquestion, through: :question
 
end

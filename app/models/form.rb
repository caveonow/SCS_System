class Form < ActiveRecord::Base
  belongs_to :user
  has_many :section
  
  has_many :question, through: :section
  has_many :answer, through: :question
  has_many :subanswer, through: :answer
  has_many :subquestion, through: :answer
  has_many :subquestionanswer, through: :subquestion
  
  
  
   validates_presence_of :FormName, :FormDescription
end

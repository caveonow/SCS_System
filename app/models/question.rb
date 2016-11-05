class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answer, :dependent => :destroy
  
  has_many :subanswer, through: :answer
  has_many :subquestion, through: :answer
  has_many :subquestionanswer, through: :subquestion
  
  has_many :studanswer, through: :answer
  has_many :studsubanswer, through: :subanswer
  has_many :studsubquestionanswer, through: :subquestionanswer
  
  
  validates_presence_of :QuestionDesc, :QuestionNumber, :section_id
end

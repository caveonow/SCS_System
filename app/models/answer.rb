class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :studanswer,  :dependent => :destroy
  
  has_many :subanswer, :dependent => :destroy
  has_many :subquestion, :dependent => :destroy
  
  has_many :subquestionanswer, through: :subquestion
  
  
  validates_presence_of :AnswerDesc, :AnswerCount
end

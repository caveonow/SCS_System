class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answer, :dependent => :destroy  
  has_many :studanswer, through: :answer
  
  
  validates_presence_of :QuestionDesc, :QuestionNumber, :section_id
end

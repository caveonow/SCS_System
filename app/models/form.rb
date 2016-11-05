class Form < ActiveRecord::Base
  belongs_to :user
  has_many :section, :dependent => :destroy
  
  has_many :question, through: :section
  has_many :answer, through: :question
  has_many :subanswer, through: :answer
  has_many :subquestion, through: :answer
  has_many :subquestionanswer, through: :subquestion
  
  has_many :studanswer, through: :answer
  has_many :studsubanswer, through: :subanswer
  has_many :studsubquestionanswer, through: :subquestionanswer
  
  validates_presence_of :FormName, :FormDescription
end

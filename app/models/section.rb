class Section < ActiveRecord::Base
  belongs_to :form
  has_many :question, :dependent => :destroy
  
  has_many :answer, through: :question
  has_many :subanswer, through: :answer
  has_many :subquestion, through: :answer
  has_many :subquestionanswer, through: :subquestion
  
  has_many :studanswer, through: :answer
  has_many :studsubanswer, through: :subanswer
  has_many :studsubquestionanswer, through: :subquestionanswer
  
  validates_presence_of :SectionName, :SectionDescription, :form_id
end
